package grailsredis

import redis.clients.jedis.Pipeline
import org.springframework.util.StopWatch

class Redisv2Controller {

    def redisService

    def process() {

        def count = TicketV2.count()
        def current = 0

        while (current < count) {

            StopWatch stopWatch = new StopWatch('RedisV2')

            stopWatch.start('mysql')
            def ticketList = TicketV2.list(offset: current, max: 10000)
            stopWatch.stop()

            stopWatch.start('redis')
            redisService.withPipeline {Pipeline pipeline->
                ticketList.each { TicketV2 ticket ->
                    def day = ticket.datetimePost
                    def id = ticket.id.toString()
                    pipeline.sadd("$day:${ticket.sentiment}", id)
                    pipeline.sadd("$day:${ticket.channelCountry}", id)
                    pipeline.sadd("$day:${ticket.channelType}", id)
                    pipeline.sadd("$day:${ticket.subjectName}", id)
                    pipeline.sadd("$day:${ticket.topicName}", id)
                    pipeline.sadd("$day:${ticket.isClose}", id)
                }
            }
            stopWatch.stop()

            current += ticketList.size()

            println "Current:$current"
            println(stopWatch.prettyPrint())
        }

        render "$count done!"
    }
}
