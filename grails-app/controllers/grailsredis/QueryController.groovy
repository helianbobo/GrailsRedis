package grailsredis

import com.brandtology.KeyHelper
import com.brandtology.DateHelper
import redis.clients.jedis.Jedis
import org.springframework.util.StopWatch
import grails.converters.JSON

class QueryController {

    def redisService

    def index() { }

    def query() {
        def keys = []

        def helper = new KeyHelper('overview')
        def days = new DateHelper(params.from_date, params.to_date).generateByDay()

        params.sentiment.split(',') each {sentiment ->
            params.subjectId.split(',').each {subjectId ->
                days.each {date ->
                    keys << helper.generateKey(params.clientAccountId, date, subjectId, sentiment)
                }
            }
        }

        String[] keysArray = new String[keys.size()]
        keys.eachWithIndex {key, index ->
            keysArray[index] = key
        }

        StopWatch stopWatch = new StopWatch("Query")
        stopWatch.start()
        redisService.mget(keysArray).each {
            println it
        }
        stopWatch.stop()
        println "${keys.size()} keys"
        println stopWatch.prettyPrint()

        def result = [:]
        result.xAxis = []
        result.series = []

        response.contentType = 'application/json'
        render '''{"xAxis":["General Mention","Retail Variety"],"series":[{"name":"Very Positive","data":[17,35]},{"name":"Positive","data":[4,5]},{"name":"Neutral","data":[502,52]},{"name":"Negative","data":[4,5]},{"name":"Very Negative","data":[2,7]}],"xAxisInfo":[4345,4346]}'''
//        render result as JSON
    }
}
