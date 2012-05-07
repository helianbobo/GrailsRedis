package grailsredis

import com.brandtology.DateHelper
import com.brandtology.KeyHelper
import org.springframework.util.StopWatch
import grails.converters.JSON

class QueryController {

    def redisService

    def index() { }

    def query() {
        def keys = []
        def resultMap = [:]

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
        redisService.mget(keysArray).eachWithIndex {value, index->
            if(value)
                resultMap[keysArray[index]] = value
        }
        stopWatch.stop()
        println "${keys.size()} keys"
        println stopWatch.prettyPrint()

        println resultMap

        def result = [:]
        result.xAxis = []
        params.subjectId.split(',').each {
            result.xAxis << it
        }

        result.series = []
        params.sentiment.split(',').each{sentiment->
            def item = [:]
            item.name = sentiment
            item.data = []
            params.subjectId.split(',').each{subjectId->
                def sum = 0
                days.each{day->
                    def value = resultMap[helper.generateKey(params.clientAccountId, day, subjectId, sentiment)]
                    if (value)
                        sum += Integer.parseInt(value)
                }
                item.data << sum
            }
            result.series << item
        }

        response.contentType = 'application/json'
//        render '''{"xAxis":["General Mention","Retail Variety"],"series":[{"name":"Very Positive","data":[17,35]},{"name":"Positive","data":[4,5]},{"name":"Neutral","data":[502,52]},{"name":"Negative","data":[4,5]},{"name":"Very Negative","data":[2,7]}],"xAxisInfo":[4345,4346]}'''
        render result as JSON
    }
}
