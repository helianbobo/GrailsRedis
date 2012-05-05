package grailsredis

class Ticket {
	Date datetimeCreated
	Date datetimePosted
	Date datetimeStatus
	Boolean isArticle
	Long channelId
	Long articleId
	Long commentId
	Long subjectId
	Long clientAccountId
	Long staffUserAccountId
	Boolean isRelevant
	Double sentimentScore
	Double priorityScore
	Integer normalisedSentimentScore
	Integer normalisedPriorityScore
	String lockBy
	String title
	String content
	Integer confidenceScore
	String channelSiteType
	String channelLanguage
	String channelCategory
	String channelName
	String channelCountry
	String channelDeepSearch
	String channelToMonitor
	Long parentChannelId
	String statusName
	Integer voiceInfluenceScore
	Integer normalisedVoiceInfluenceScore
	Long voiceId
	String voiceName
	Long qualityIssueBy
	Long qualityCheckedBy
	boolean watchlist
	String url
	Long ticketClosedBy
	Long ticketStatus
	String voiceUrl

    def getSentiment(){
        def result = "VN"
        if(normalisedSentimentScore > 50)
            result = 'VP'
        else if(normalisedSentimentScore > 0 && normalisedSentimentScore <= 50)
            result = 'P'
        else if(normalisedSentimentScore == 0 )
            result = 'NE'
        else if(normalisedSentimentScore < 0 && normalisedSentimentScore >= -50)
            result = 'N'
        return result
    }

	//static hasMany = [ ticketHistories : TicketHistory ]

	static mapping = {
		version false
		table  'Ticket'
		columns {
			ticketStatus column:'Status'
		}
//		datasource 'ticket'
	}

	static constraints = {
		datetimeCreated(nullable:true)
		datetimePosted(nullable:true)
		datetimeStatus(nullable:true)
		qualityIssueBy(nullable:true)
		qualityCheckedBy(nullable:true)
		ticketClosedBy(nullable:true)
		lockBy(nullable:true)
		staffUserAccountId(nullable:true)
		articleId(nullable:true)
		commentId(nullable:true)
		voiceId(nullable:true)
		channelSiteType(nullable:true)
		channelLanguage(nullable:true)
		channelCategory(nullable:true)
		channelName(nullable:true)
		channelCountry(nullable:true)
		channelDeepSearch(nullable:true)
		channelToMonitor(nullable:true)
	}
}

