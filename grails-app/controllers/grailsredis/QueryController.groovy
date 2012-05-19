package grailsredis

import com.brandtology.DateHelper
import com.brandtology.KeyHelper
import org.springframework.util.StopWatch
import grails.converters.JSON
import java.text.SimpleDateFormat

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

        sentiments.each {sentiment ->
            cube[sentiment] = [:]
            subjectIds.each {subjectId ->
                def sum = 0
                def keyArray = new String[days.size()]
                days.eachWithIndex {day, index ->
                    def key = helper.generateKey(params.clientAccountId, day, subjectId, sentiment)
                    keyArray[index] = key
                }
                def values = redisService.mget(keyArray)

                values.each {value ->
                    if (value)
                        sum += Integer.parseInt(value)
                }

                cube[sentiment][subjectId] = sum
            }
        }

        sentiments.each {sentiment ->
            def item = [:]
            item.name = sentiment
            item.data = []
            subjectIds.each {subjectId ->
                item.data << cube[sentiment][subjectId]
            }
            result.series << item
        }

        stopWatch.stop()
        println stopWatch.prettyPrint()
        response.contentType = 'application/json'
        render result as JSON
    }

    def eval() {
        render redisService.eval("return redis.call('dbsize')")
    }

    def queryv2() {

        StopWatch stopWatch = new StopWatch('queryv2')

        def dimensions = [:]

        SimpleDateFormat format = new SimpleDateFormat('yyyy_MM_dd')

        def from = format.parse(params.from)
        def to = format.parse(params.to)

        def query = "select count(*) from TicketV2 where datetimePost <= '${params.to}' and datetimePost >= '${params.from}'"

        if (params.sentiment) {
            dimensions.sentiment = params.sentiment.split(',')
            query += " and (" + dimensions.sentiment.collect{" sentiment = '$it'"}.join(' or ') + ") "
        }

        if (params.topicName) {
            dimensions.topicName = params.topicName.split(',')
        }

        if (params.subjectName) {
            dimensions.subjectName = params.subjectName.split(',')
        }
        if (params.channelType) {
            dimensions.channelType = params.channelType.split(',')
        }
        if (params.channelCountry) {
            dimensions.channelCountry = params.channelCountry.split(',')
        }
        if (params.isClose) {
            dimensions.isClose = [params.isClose]
        }

        println query

        stopWatch.start('redis')
        def redisCount = 0
        (from..to).each {Date day->
            def dayStr = day.format('yyyy_MM_dd')

            def setKeys = []

            dimensions.each {entry->

                def key = entry.key
                def values = entry.value

                def destinationKey = "TEMP:UNION:${dayStr}:${key}".toString()
                String[] setKeyArray = new String[values.size()];
                redisService.sunionstore(destinationKey,values.collect {"$dayStr:${it}".toString()}.toArray(setKeyArray))
                setKeys << destinationKey
            }

            def daySetkey = "TEMP:INTER:${dayStr}".toString()
            String [] setKeysArray = new String[setKeys.size()];
            redisCount += redisService.sinterstore(daySetkey, setKeys.toArray(setKeysArray))

            redisService.del(daySetkey)
            redisService.del(setKeysArray)
        }
        stopWatch.stop()


        stopWatch.start('hql')
        def sqlCount = TicketV2.executeQuery(query)[0]
        stopWatch.stop()

        render "sqlCount: $sqlCount | redisCount: $redisCount \n${stopWatch.prettyPrint()}"

    }
}
