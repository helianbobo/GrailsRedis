package grailsredis

import com.brandtology.DateHelper
import com.brandtology.KeyHelper
import org.springframework.util.StopWatch
import grails.converters.JSON

class QueryController {

    def redisService

    def index() { }

    def query() {

        StopWatch stopWatch = new StopWatch("Query")
        stopWatch.start()

        def keys = []
        def resultMap = [:]

        def helper = new KeyHelper('_overview')
        def days = new DateHelper(params.from_date, params.to_date).generateByDay()

        /*params.sentiment.split(',') each {sentiment ->
            params.subjectId.split(',').each {subjectId ->
                days.each {date ->
                    keys << helper.generateKey(params.clientAccountId, date, subjectId, sentiment)
                }
            }
        }

        String[] keysArray = new String[keys.size()]
        keys.eachWithIndex {key, index ->
            keysArray[index] = key
        }*/



        /*keys.each{key->
            resultMap[key] = redisService.scard(key)
        }
*/
        /*redisService.mget(keysArray).eachWithIndex {value, index->
            if(value)
                resultMap[keysArray[index]] = value
        }*/



        def result = [:]
        result.xAxis = []
        def subjectIds = params.subjectId.split(',')
        subjectIds.each {
            result.xAxis << it
        }

        result.series = []
        def sentiments = params.sentiment.split(',')

        def cube = [:]

        sentiments.each{sentiment->
            cube[sentiment] = [:]
            subjectIds.each{subjectId->
                def sum = 0
                def keyArray = new String[days.size()]
                days.eachWithIndex{day, index->
                    def key = helper.generateKey(params.clientAccountId, day, subjectId, sentiment)
                    keyArray[index] = key
                }
                def values = redisService.mget(keyArray)

                values.each{value->
                    if (value)
                        sum += Integer.parseInt(value)
                }

                cube[sentiment][subjectId] = sum
            }
        }

        sentiments.each {sentiment->
            def item = [:]
            item.name = sentiment
            item.data = []
            subjectIds.each{subjectId->
                item.data << cube[sentiment][subjectId]
            }
            result.series << item
        }

        stopWatch.stop()
        println stopWatch.prettyPrint()
        response.contentType = 'application/json'
        render result as JSON
    }

    def eval(){
        render redisService.eval("return redis.call('dbsize')")
    }
}
