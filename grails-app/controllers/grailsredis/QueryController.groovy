package grailsredis

import com.brandtology.KeyHelper
import com.brandtology.DateHelper
import redis.clients.jedis.Jedis
import org.springframework.util.StopWatch

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

        flash.message = "${keys.size()} keys"
        redirect(action: 'index')
    }
}
