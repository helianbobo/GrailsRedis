<%@ page import="grailsredis.TicketV2" %>



<div class="fieldcontain ${hasErrors(bean: ticketV2Instance, field: 'channelCountry', 'error')} ">
	<label for="channelCountry">
		<g:message code="ticketV2.channelCountry.label" default="Channel Country" />
		
	</label>
	<g:textField name="channelCountry" value="${ticketV2Instance?.channelCountry}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketV2Instance, field: 'channelType', 'error')} ">
	<label for="channelType">
		<g:message code="ticketV2.channelType.label" default="Channel Type" />
		
	</label>
	<g:textField name="channelType" value="${ticketV2Instance?.channelType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketV2Instance, field: 'datetimePost', 'error')} ">
	<label for="datetimePost">
		<g:message code="ticketV2.datetimePost.label" default="Datetime Post" />
		
	</label>
	<g:textField name="datetimePost" value="${ticketV2Instance?.datetimePost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketV2Instance, field: 'isClose', 'error')} ">
	<label for="isClose">
		<g:message code="ticketV2.isClose.label" default="Is Close" />
		
	</label>
	<g:textField name="isClose" value="${ticketV2Instance?.isClose}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketV2Instance, field: 'sentiment', 'error')} ">
	<label for="sentiment">
		<g:message code="ticketV2.sentiment.label" default="Sentiment" />
		
	</label>
	<g:textField name="sentiment" value="${ticketV2Instance?.sentiment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketV2Instance, field: 'subjectName', 'error')} ">
	<label for="subject">
		<g:message code="ticketV2.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${ticketV2Instance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketV2Instance, field: 'topicName', 'error')} ">
	<label for="topic">
		<g:message code="ticketV2.topic.label" default="Topic" />
		
	</label>
	<g:textField name="topic" value="${ticketV2Instance?.topic}"/>
</div>

