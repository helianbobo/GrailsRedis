import grailsredis.TicketV2

class BootStrap {

    def init = { servletContext ->
        environments {
            test {

            }
            development {
//                createInitData()
            }
        }
    }

    def createInitData(){

        def total = 0

        def maxTicketsPerDay = 10000

        def subjectTopicMap = [
                subject_101:'topic_001',
                subject_102:'topic_001',
                subject_103:'topic_001',
                subject_104:'topic_001',
                subject_105:'topic_001',
                subject_106:'topic_001',
                subject_107:'topic_001',

                subject_201:'topic_002',
                subject_202:'topic_002',
                subject_203:'topic_002',
                subject_204:'topic_002',

                subject_301:'topic_003',
                subject_302:'topic_003',
                subject_303:'topic_003',
                subject_304:'topic_003',
                subject_305:'topic_003',
                subject_306:'topic_003',
                subject_307:'topic_003',
        ]

        def subjectSet = subjectTopicMap.keySet().asList()

        def channelCountryList = ['SG', 'CN', 'US', 'UK', 'JP']
        def channelTypeList = ['FORUM', 'BLOG', 'SNS']
        def sentimentList = ['P', 'VP', 'NE', 'N', 'VN']


        def end = new Date()
        def start = end.minus(90)
        def dayList = (end..start).collect {Date day ->
            day.format("yyyy_MM_dd")
        }

        def random = new Random()
        dayList.each {day->
            int numberOfTickets = random.nextInt(maxTicketsPerDay)
            numberOfTickets.times {
                TicketV2 ticket = new TicketV2()
                ticket.channelCountry = channelCountryList[random.nextInt(channelCountryList.size())]
                ticket.channelType = channelTypeList[random.nextInt(channelTypeList.size())]
                ticket.datetimePost = day
                ticket.isClose = String.valueOf(random.nextBoolean())
                ticket.sentiment = sentimentList[random.nextInt(sentimentList.size())]
                ticket.subjectName = subjectSet[random.nextInt(subjectSet.size())]
                ticket.topicName = subjectTopicMap[ticket.subjectName]

                ticket.save()
            }

            total += numberOfTickets

            println "$day done. $numberOfTickets tickets created. Total: $total"
        }


    }

    def destroy = {
    }
}
