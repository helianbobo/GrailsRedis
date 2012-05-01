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

        def count = Ticket.countByDatetimeCreatedBetween(from, to)
        def current = 0
        while(current < count){
            def query = Ticket.where {
                datetimeCreated <= to && datetimeCreated >= from
            }
            def list = query.list(max: 10000, offset: current)

            StopWatch stopWatch = new StopWatch("pushTpRedis")
            stopWatch.start()
            pushToRedis(list)
            stopWatch.stop()
            println stopWatch.prettyPrint()

            current += list.size()

            println "$current/$count tickets processed."
        }

        flash.message = "${current} processed"
        redirect(action: 'index')
    }

    def pushToRedis(list){

        def queryName = "overview"

        redisService.withPipeline {Pipeline pipeline ->
            list.each{Ticket ticket->
                def key = "${queryName}:${ticket.clientAccountId}:${ticket.subjectId}:${ticket.datetimeCreated.format("yyMMdd")}:${ticket.sentiment}"
                pipeline.sadd(key, "${ticket.id}")
            }
        }
    }

}
