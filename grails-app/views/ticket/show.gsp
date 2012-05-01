
<%@ page import="grailsredis.Ticket" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticket" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ticket">
			
				<g:if test="${ticketInstance?.datetimeCreated}">
				<li class="fieldcontain">
					<span id="datetimeCreated-label" class="property-label"><g:message code="ticket.datetimeCreated.label" default="Datetime Created" /></span>
					
						<span class="property-value" aria-labelledby="datetimeCreated-label"><g:formatDate date="${ticketInstance?.datetimeCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.datetimePosted}">
				<li class="fieldcontain">
					<span id="datetimePosted-label" class="property-label"><g:message code="ticket.datetimePosted.label" default="Datetime Posted" /></span>
					
						<span class="property-value" aria-labelledby="datetimePosted-label"><g:formatDate date="${ticketInstance?.datetimePosted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.datetimeStatus}">
				<li class="fieldcontain">
					<span id="datetimeStatus-label" class="property-label"><g:message code="ticket.datetimeStatus.label" default="Datetime Status" /></span>
					
						<span class="property-value" aria-labelledby="datetimeStatus-label"><g:formatDate date="${ticketInstance?.datetimeStatus}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.qualityIssueBy}">
				<li class="fieldcontain">
					<span id="qualityIssueBy-label" class="property-label"><g:message code="ticket.qualityIssueBy.label" default="Quality Issue By" /></span>
					
						<span class="property-value" aria-labelledby="qualityIssueBy-label"><g:fieldValue bean="${ticketInstance}" field="qualityIssueBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.qualityCheckedBy}">
				<li class="fieldcontain">
					<span id="qualityCheckedBy-label" class="property-label"><g:message code="ticket.qualityCheckedBy.label" default="Quality Checked By" /></span>
					
						<span class="property-value" aria-labelledby="qualityCheckedBy-label"><g:fieldValue bean="${ticketInstance}" field="qualityCheckedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.ticketClosedBy}">
				<li class="fieldcontain">
					<span id="ticketClosedBy-label" class="property-label"><g:message code="ticket.ticketClosedBy.label" default="Ticket Closed By" /></span>
					
						<span class="property-value" aria-labelledby="ticketClosedBy-label"><g:fieldValue bean="${ticketInstance}" field="ticketClosedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.lockBy}">
				<li class="fieldcontain">
					<span id="lockBy-label" class="property-label"><g:message code="ticket.lockBy.label" default="Lock By" /></span>
					
						<span class="property-value" aria-labelledby="lockBy-label"><g:fieldValue bean="${ticketInstance}" field="lockBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.staffUserAccountId}">
				<li class="fieldcontain">
					<span id="staffUserAccountId-label" class="property-label"><g:message code="ticket.staffUserAccountId.label" default="Staff User Account Id" /></span>
					
						<span class="property-value" aria-labelledby="staffUserAccountId-label"><g:fieldValue bean="${ticketInstance}" field="staffUserAccountId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.articleId}">
				<li class="fieldcontain">
					<span id="articleId-label" class="property-label"><g:message code="ticket.articleId.label" default="Article Id" /></span>
					
						<span class="property-value" aria-labelledby="articleId-label"><g:fieldValue bean="${ticketInstance}" field="articleId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.commentId}">
				<li class="fieldcontain">
					<span id="commentId-label" class="property-label"><g:message code="ticket.commentId.label" default="Comment Id" /></span>
					
						<span class="property-value" aria-labelledby="commentId-label"><g:fieldValue bean="${ticketInstance}" field="commentId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.voiceId}">
				<li class="fieldcontain">
					<span id="voiceId-label" class="property-label"><g:message code="ticket.voiceId.label" default="Voice Id" /></span>
					
						<span class="property-value" aria-labelledby="voiceId-label"><g:fieldValue bean="${ticketInstance}" field="voiceId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelSiteType}">
				<li class="fieldcontain">
					<span id="channelSiteType-label" class="property-label"><g:message code="ticket.channelSiteType.label" default="Channel Site Type" /></span>
					
						<span class="property-value" aria-labelledby="channelSiteType-label"><g:fieldValue bean="${ticketInstance}" field="channelSiteType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelLanguage}">
				<li class="fieldcontain">
					<span id="channelLanguage-label" class="property-label"><g:message code="ticket.channelLanguage.label" default="Channel Language" /></span>
					
						<span class="property-value" aria-labelledby="channelLanguage-label"><g:fieldValue bean="${ticketInstance}" field="channelLanguage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelCategory}">
				<li class="fieldcontain">
					<span id="channelCategory-label" class="property-label"><g:message code="ticket.channelCategory.label" default="Channel Category" /></span>
					
						<span class="property-value" aria-labelledby="channelCategory-label"><g:fieldValue bean="${ticketInstance}" field="channelCategory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelName}">
				<li class="fieldcontain">
					<span id="channelName-label" class="property-label"><g:message code="ticket.channelName.label" default="Channel Name" /></span>
					
						<span class="property-value" aria-labelledby="channelName-label"><g:fieldValue bean="${ticketInstance}" field="channelName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelCountry}">
				<li class="fieldcontain">
					<span id="channelCountry-label" class="property-label"><g:message code="ticket.channelCountry.label" default="Channel Country" /></span>
					
						<span class="property-value" aria-labelledby="channelCountry-label"><g:fieldValue bean="${ticketInstance}" field="channelCountry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelDeepSearch}">
				<li class="fieldcontain">
					<span id="channelDeepSearch-label" class="property-label"><g:message code="ticket.channelDeepSearch.label" default="Channel Deep Search" /></span>
					
						<span class="property-value" aria-labelledby="channelDeepSearch-label"><g:fieldValue bean="${ticketInstance}" field="channelDeepSearch"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelToMonitor}">
				<li class="fieldcontain">
					<span id="channelToMonitor-label" class="property-label"><g:message code="ticket.channelToMonitor.label" default="Channel To Monitor" /></span>
					
						<span class="property-value" aria-labelledby="channelToMonitor-label"><g:fieldValue bean="${ticketInstance}" field="channelToMonitor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.channelId}">
				<li class="fieldcontain">
					<span id="channelId-label" class="property-label"><g:message code="ticket.channelId.label" default="Channel Id" /></span>
					
						<span class="property-value" aria-labelledby="channelId-label"><g:fieldValue bean="${ticketInstance}" field="channelId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.clientAccountId}">
				<li class="fieldcontain">
					<span id="clientAccountId-label" class="property-label"><g:message code="ticket.clientAccountId.label" default="Client Account Id" /></span>
					
						<span class="property-value" aria-labelledby="clientAccountId-label"><g:fieldValue bean="${ticketInstance}" field="clientAccountId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.confidenceScore}">
				<li class="fieldcontain">
					<span id="confidenceScore-label" class="property-label"><g:message code="ticket.confidenceScore.label" default="Confidence Score" /></span>
					
						<span class="property-value" aria-labelledby="confidenceScore-label"><g:fieldValue bean="${ticketInstance}" field="confidenceScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="ticket.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${ticketInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.isArticle}">
				<li class="fieldcontain">
					<span id="isArticle-label" class="property-label"><g:message code="ticket.isArticle.label" default="Is Article" /></span>
					
						<span class="property-value" aria-labelledby="isArticle-label"><g:formatBoolean boolean="${ticketInstance?.isArticle}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.isRelevant}">
				<li class="fieldcontain">
					<span id="isRelevant-label" class="property-label"><g:message code="ticket.isRelevant.label" default="Is Relevant" /></span>
					
						<span class="property-value" aria-labelledby="isRelevant-label"><g:formatBoolean boolean="${ticketInstance?.isRelevant}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.normalisedPriorityScore}">
				<li class="fieldcontain">
					<span id="normalisedPriorityScore-label" class="property-label"><g:message code="ticket.normalisedPriorityScore.label" default="Normalised Priority Score" /></span>
					
						<span class="property-value" aria-labelledby="normalisedPriorityScore-label"><g:fieldValue bean="${ticketInstance}" field="normalisedPriorityScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.normalisedSentimentScore}">
				<li class="fieldcontain">
					<span id="normalisedSentimentScore-label" class="property-label"><g:message code="ticket.normalisedSentimentScore.label" default="Normalised Sentiment Score" /></span>
					
						<span class="property-value" aria-labelledby="normalisedSentimentScore-label"><g:fieldValue bean="${ticketInstance}" field="normalisedSentimentScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.normalisedVoiceInfluenceScore}">
				<li class="fieldcontain">
					<span id="normalisedVoiceInfluenceScore-label" class="property-label"><g:message code="ticket.normalisedVoiceInfluenceScore.label" default="Normalised Voice Influence Score" /></span>
					
						<span class="property-value" aria-labelledby="normalisedVoiceInfluenceScore-label"><g:fieldValue bean="${ticketInstance}" field="normalisedVoiceInfluenceScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.parentChannelId}">
				<li class="fieldcontain">
					<span id="parentChannelId-label" class="property-label"><g:message code="ticket.parentChannelId.label" default="Parent Channel Id" /></span>
					
						<span class="property-value" aria-labelledby="parentChannelId-label"><g:fieldValue bean="${ticketInstance}" field="parentChannelId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.priorityScore}">
				<li class="fieldcontain">
					<span id="priorityScore-label" class="property-label"><g:message code="ticket.priorityScore.label" default="Priority Score" /></span>
					
						<span class="property-value" aria-labelledby="priorityScore-label"><g:fieldValue bean="${ticketInstance}" field="priorityScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.sentimentScore}">
				<li class="fieldcontain">
					<span id="sentimentScore-label" class="property-label"><g:message code="ticket.sentimentScore.label" default="Sentiment Score" /></span>
					
						<span class="property-value" aria-labelledby="sentimentScore-label"><g:fieldValue bean="${ticketInstance}" field="sentimentScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.statusName}">
				<li class="fieldcontain">
					<span id="statusName-label" class="property-label"><g:message code="ticket.statusName.label" default="Status Name" /></span>
					
						<span class="property-value" aria-labelledby="statusName-label"><g:fieldValue bean="${ticketInstance}" field="statusName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.subjectId}">
				<li class="fieldcontain">
					<span id="subjectId-label" class="property-label"><g:message code="ticket.subjectId.label" default="Subject Id" /></span>
					
						<span class="property-value" aria-labelledby="subjectId-label"><g:fieldValue bean="${ticketInstance}" field="subjectId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.ticketStatus}">
				<li class="fieldcontain">
					<span id="ticketStatus-label" class="property-label"><g:message code="ticket.ticketStatus.label" default="Ticket Status" /></span>
					
						<span class="property-value" aria-labelledby="ticketStatus-label"><g:fieldValue bean="${ticketInstance}" field="ticketStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="ticket.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${ticketInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="ticket.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${ticketInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.voiceInfluenceScore}">
				<li class="fieldcontain">
					<span id="voiceInfluenceScore-label" class="property-label"><g:message code="ticket.voiceInfluenceScore.label" default="Voice Influence Score" /></span>
					
						<span class="property-value" aria-labelledby="voiceInfluenceScore-label"><g:fieldValue bean="${ticketInstance}" field="voiceInfluenceScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.voiceName}">
				<li class="fieldcontain">
					<span id="voiceName-label" class="property-label"><g:message code="ticket.voiceName.label" default="Voice Name" /></span>
					
						<span class="property-value" aria-labelledby="voiceName-label"><g:fieldValue bean="${ticketInstance}" field="voiceName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.voiceUrl}">
				<li class="fieldcontain">
					<span id="voiceUrl-label" class="property-label"><g:message code="ticket.voiceUrl.label" default="Voice Url" /></span>
					
						<span class="property-value" aria-labelledby="voiceUrl-label"><g:fieldValue bean="${ticketInstance}" field="voiceUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.watchlist}">
				<li class="fieldcontain">
					<span id="watchlist-label" class="property-label"><g:message code="ticket.watchlist.label" default="Watchlist" /></span>
					
						<span class="property-value" aria-labelledby="watchlist-label"><g:formatBoolean boolean="${ticketInstance?.watchlist}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ticketInstance?.id}" />
					<g:link class="edit" action="edit" id="${ticketInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
