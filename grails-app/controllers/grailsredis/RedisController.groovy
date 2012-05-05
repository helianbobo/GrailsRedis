package grailsredis

import redis.clients.jedis.Pipeline
import org.springframework.util.StopWatch
import groovy.sql.Sql
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit
import java.util.concurrent.Executors
import java.util.concurrent.ExecutorService
import com.brandtology.KeyHelper

class RedisController {

    def redisService

    def dataSource

    static allowedMethods = [process: "POST"]

    def index() {
    }

    def process() {


        def from = params.from_date
        def to = params.to_date

        def count = Ticket.countByDatetimePostedBetween(from, to)
        def current = 0

        ExecutorService exec = Executors.newFixedThreadPool(10);

        while (current < count) {


            def list = hqlQuery(from, to, 100000, current)


            exec.execute(new Runnable() {
                @Override
                void run() {

                    pushToRedis(list)

                }
            })


            current += list.size()
            println "$current/$count tickets processed."

        }


        flash.message = "${current} processed"
        redirect(action: 'index')
    }

    def hqlQuery(from, to, max, offset) {
        def hql = """
        select id, datetimePosted, clientAccountId, subjectId, normalisedSentimentScore
        from Ticket
        where datetimePosted >= ? and
        datetimePosted <= ?
        """

        Ticket.executeQuery(hql, [from, to], [max: 100000, offset: offset])
    }

    def sqlQuery(from, to, max, offset) {

        Sql sql = new Sql(dataSource)

        def sqlQuery = '''
select id, datetime_Posted, client_Account_Id, subject_Id, normalised_Sentiment_Score
        from Ticket
        where datetime_Posted >= ? and
        datetime_Posted <= ?
'''
        sql.rows(sqlQuery, [from, to], offset, max)

    }

    def pushToRedis(list) {

        def queryName = "overview"

        def helper = new KeyHelper(queryName)

        redisService.withPipeline {pipeline ->
            list.each {ticket ->

                def datetimePosted = ticket[1]
                def clientAccountId = ticket[2]
                def subjectId = ticket[3]
                def sentiment = "VN"
                if (ticket[4] > 50)
                    sentiment = 'VP'
                else if (ticket[4] > 0 && ticket[4] <= 50)
                    sentiment = 'P'
                else if (ticket[4] == 0)
                    sentiment = 'NE'
                else if (ticket[4] < 0 && ticket[4] >= -50)
                    sentiment = 'N'

                def key = helper.generateKey(queryName, datetimePosted, subjectId, sentiment)

                pipeline.incr(key)
            }
        }
    }

}
