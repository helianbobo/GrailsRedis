<%@ page import="grailsredis.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'datetimeCreated', 'error')} ">
	<label for="datetimeCreated">
		<g:message code="ticket.datetimeCreated.label" default="Datetime Created" />
		
	</label>
	<g:datePicker name="datetimeCreated" precision="day"  value="${ticketInstance?.datetimeCreated}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'datetimePosted', 'error')} ">
	<label for="datetimePosted">
		<g:message code="ticket.datetimePosted.label" default="Datetime Posted" />
		
	</label>
	<g:datePicker name="datetimePosted" precision="day"  value="${ticketInstance?.datetimePosted}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'datetimeStatus', 'error')} ">
	<label for="datetimeStatus">
		<g:message code="ticket.datetimeStatus.label" default="Datetime Status" />
		
	</label>
	<g:datePicker name="datetimeStatus" precision="day"  value="${ticketInstance?.datetimeStatus}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'qualityIssueBy', 'error')} ">
	<label for="qualityIssueBy">
		<g:message code="ticket.qualityIssueBy.label" default="Quality Issue By" />
		
	</label>
	<g:field type="number" name="qualityIssueBy" value="${fieldValue(bean: ticketInstance, field: 'qualityIssueBy')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'qualityCheckedBy', 'error')} ">
	<label for="qualityCheckedBy">
		<g:message code="ticket.qualityCheckedBy.label" default="Quality Checked By" />
		
	</label>
	<g:field type="number" name="qualityCheckedBy" value="${fieldValue(bean: ticketInstance, field: 'qualityCheckedBy')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'ticketClosedBy', 'error')} ">
	<label for="ticketClosedBy">
		<g:message code="ticket.ticketClosedBy.label" default="Ticket Closed By" />
		
	</label>
	<g:field type="number" name="ticketClosedBy" value="${fieldValue(bean: ticketInstance, field: 'ticketClosedBy')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'lockBy', 'error')} ">
	<label for="lockBy">
		<g:message code="ticket.lockBy.label" default="Lock By" />
		
	</label>
	<g:textField name="lockBy" value="${ticketInstance?.lockBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'staffUserAccountId', 'error')} ">
	<label for="staffUserAccountId">
		<g:message code="ticket.staffUserAccountId.label" default="Staff User Account Id" />
		
	</label>
	<g:field type="number" name="staffUserAccountId" value="${fieldValue(bean: ticketInstance, field: 'staffUserAccountId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'articleId', 'error')} ">
	<label for="articleId">
		<g:message code="ticket.articleId.label" default="Article Id" />
		
	</label>
	<g:field type="number" name="articleId" value="${fieldValue(bean: ticketInstance, field: 'articleId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'commentId', 'error')} ">
	<label for="commentId">
		<g:message code="ticket.commentId.label" default="Comment Id" />
		
	</label>
	<g:field type="number" name="commentId" value="${fieldValue(bean: ticketInstance, field: 'commentId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'voiceId', 'error')} ">
	<label for="voiceId">
		<g:message code="ticket.voiceId.label" default="Voice Id" />
		
	</label>
	<g:field type="number" name="voiceId" value="${fieldValue(bean: ticketInstance, field: 'voiceId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelSiteType', 'error')} ">
	<label for="channelSiteType">
		<g:message code="ticket.channelSiteType.label" default="Channel Site Type" />
		
	</label>
	<g:textField name="channelSiteType" value="${ticketInstance?.channelSiteType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelLanguage', 'error')} ">
	<label for="channelLanguage">
		<g:message code="ticket.channelLanguage.label" default="Channel Language" />
		
	</label>
	<g:textField name="channelLanguage" value="${ticketInstance?.channelLanguage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelCategory', 'error')} ">
	<label for="channelCategory">
		<g:message code="ticket.channelCategory.label" default="Channel Category" />
		
	</label>
	<g:textField name="channelCategory" value="${ticketInstance?.channelCategory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelName', 'error')} ">
	<label for="channelName">
		<g:message code="ticket.channelName.label" default="Channel Name" />
		
	</label>
	<g:textField name="channelName" value="${ticketInstance?.channelName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelCountry', 'error')} ">
	<label for="channelCountry">
		<g:message code="ticket.channelCountry.label" default="Channel Country" />
		
	</label>
	<g:textField name="channelCountry" value="${ticketInstance?.channelCountry}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelDeepSearch', 'error')} ">
	<label for="channelDeepSearch">
		<g:message code="ticket.channelDeepSearch.label" default="Channel Deep Search" />
		
	</label>
	<g:textField name="channelDeepSearch" value="${ticketInstance?.channelDeepSearch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelToMonitor', 'error')} ">
	<label for="channelToMonitor">
		<g:message code="ticket.channelToMonitor.label" default="Channel To Monitor" />
		
	</label>
	<g:textField name="channelToMonitor" value="${ticketInstance?.channelToMonitor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'channelId', 'error')} required">
	<label for="channelId">
		<g:message code="ticket.channelId.label" default="Channel Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="channelId" required="" value="${fieldValue(bean: ticketInstance, field: 'channelId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'clientAccountId', 'error')} required">
	<label for="clientAccountId">
		<g:message code="ticket.clientAccountId.label" default="Client Account Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="clientAccountId" required="" value="${fieldValue(bean: ticketInstance, field: 'clientAccountId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'confidenceScore', 'error')} required">
	<label for="confidenceScore">
		<g:message code="ticket.confidenceScore.label" default="Confidence Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="confidenceScore" required="" value="${fieldValue(bean: ticketInstance, field: 'confidenceScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="ticket.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${ticketInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'isArticle', 'error')} ">
	<label for="isArticle">
		<g:message code="ticket.isArticle.label" default="Is Article" />
		
	</label>
	<g:checkBox name="isArticle" value="${ticketInstance?.isArticle}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'isRelevant', 'error')} ">
	<label for="isRelevant">
		<g:message code="ticket.isRelevant.label" default="Is Relevant" />
		
	</label>
	<g:checkBox name="isRelevant" value="${ticketInstance?.isRelevant}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'normalisedPriorityScore', 'error')} required">
	<label for="normalisedPriorityScore">
		<g:message code="ticket.normalisedPriorityScore.label" default="Normalised Priority Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="normalisedPriorityScore" required="" value="${fieldValue(bean: ticketInstance, field: 'normalisedPriorityScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'normalisedSentimentScore', 'error')} required">
	<label for="normalisedSentimentScore">
		<g:message code="ticket.normalisedSentimentScore.label" default="Normalised Sentiment Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="normalisedSentimentScore" required="" value="${fieldValue(bean: ticketInstance, field: 'normalisedSentimentScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'normalisedVoiceInfluenceScore', 'error')} required">
	<label for="normalisedVoiceInfluenceScore">
		<g:message code="ticket.normalisedVoiceInfluenceScore.label" default="Normalised Voice Influence Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="normalisedVoiceInfluenceScore" required="" value="${fieldValue(bean: ticketInstance, field: 'normalisedVoiceInfluenceScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'parentChannelId', 'error')} required">
	<label for="parentChannelId">
		<g:message code="ticket.parentChannelId.label" default="Parent Channel Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="parentChannelId" required="" value="${fieldValue(bean: ticketInstance, field: 'parentChannelId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'priorityScore', 'error')} required">
	<label for="priorityScore">
		<g:message code="ticket.priorityScore.label" default="Priority Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="priorityScore" required="" value="${fieldValue(bean: ticketInstance, field: 'priorityScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'sentimentScore', 'error')} required">
	<label for="sentimentScore">
		<g:message code="ticket.sentimentScore.label" default="Sentiment Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="sentimentScore" required="" value="${fieldValue(bean: ticketInstance, field: 'sentimentScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'statusName', 'error')} ">
	<label for="statusName">
		<g:message code="ticket.statusName.label" default="Status Name" />
		
	</label>
	<g:textField name="statusName" value="${ticketInstance?.statusName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'subjectId', 'error')} required">
	<label for="subjectId">
		<g:message code="ticket.subjectId.label" default="Subject Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="subjectId" required="" value="${fieldValue(bean: ticketInstance, field: 'subjectId')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'ticketStatus', 'error')} required">
	<label for="ticketStatus">
		<g:message code="ticket.ticketStatus.label" default="Ticket Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="ticketStatus" required="" value="${fieldValue(bean: ticketInstance, field: 'ticketStatus')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="ticket.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${ticketInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="ticket.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${ticketInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'voiceInfluenceScore', 'error')} required">
	<label for="voiceInfluenceScore">
		<g:message code="ticket.voiceInfluenceScore.label" default="Voice Influence Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="voiceInfluenceScore" required="" value="${fieldValue(bean: ticketInstance, field: 'voiceInfluenceScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'voiceName', 'error')} ">
	<label for="voiceName">
		<g:message code="ticket.voiceName.label" default="Voice Name" />
		
	</label>
	<g:textField name="voiceName" value="${ticketInstance?.voiceName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'voiceUrl', 'error')} ">
	<label for="voiceUrl">
		<g:message code="ticket.voiceUrl.label" default="Voice Url" />
		
	</label>
	<g:textField name="voiceUrl" value="${ticketInstance?.voiceUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'watchlist', 'error')} ">
	<label for="watchlist">
		<g:message code="ticket.watchlist.label" default="Watchlist" />
		
	</label>
	<g:checkBox name="watchlist" value="${ticketInstance?.watchlist}" />
</div>

