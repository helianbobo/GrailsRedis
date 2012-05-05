package grailsredis

import redis.clients.jedis.Pipeline
import org.springframework.util.StopWatch

class RedisController {

    def redisService

    static allowedMethods = [process: "POST"]

    def index() {
    }

    def process() {

        def from = params.from_date
        def to = params.to_date

        def hql = """
        select id, datetimePosted, clientAccountId, subjectId, normalisedSentimentScore
        from Ticket
        where datetimePosted >= ? and
        datetimePosted <= ?
        """

        def count = Ticket.countByDatetimePostedBetween(from, to)
        def current = 0
        while(current < count){
            def list = Ticket.executeQuery(hql, [from, to], [max: 100000, offset: current])

            pushToRedis(list)

            current += list.size()

            println "$current/$count tickets processed."
        }

        flash.message = "${current} processed"
        redirect(action: 'index')
    }

    def pushToRedis(list){

        def queryName = "overview"

        redisService.withPipeline {Pipeline pipeline ->
            list.each{ticket->
                def id = ticket[0]
                def datetimePosted = ticket[1]
                def clientAccountId = ticket[2]
                def subjectId = ticket[3]
                def sentiment = new Ticket(normalisedSentimentScore:ticket[4]).sentiment

                def key = "${queryName}:${clientAccountId}:${subjectId}:${datetimePosted.format("yyMMdd")}:${sentiment}"
                pipeline.sadd(key, "${id}")
            }
        }
    }

}
