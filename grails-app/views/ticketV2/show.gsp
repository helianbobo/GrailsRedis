
<%@ page import="grailsredis.TicketV2" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticketV2.label', default: 'TicketV2')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ticketV2" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticketV2" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ticketV2">
			
				<g:if test="${ticketV2Instance?.channelCountry}">
				<li class="fieldcontain">
					<span id="channelCountry-label" class="property-label"><g:message code="ticketV2.channelCountry.label" default="Channel Country" /></span>
					
						<span class="property-value" aria-labelledby="channelCountry-label"><g:fieldValue bean="${ticketV2Instance}" field="channelCountry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketV2Instance?.channelType}">
				<li class="fieldcontain">
					<span id="channelType-label" class="property-label"><g:message code="ticketV2.channelType.label" default="Channel Type" /></span>
					
						<span class="property-value" aria-labelledby="channelType-label"><g:fieldValue bean="${ticketV2Instance}" field="channelType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketV2Instance?.datetimePost}">
				<li class="fieldcontain">
					<span id="datetimePost-label" class="property-label"><g:message code="ticketV2.datetimePost.label" default="Datetime Post" /></span>
					
						<span class="property-value" aria-labelledby="datetimePost-label"><g:fieldValue bean="${ticketV2Instance}" field="datetimePost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketV2Instance?.isClose}">
				<li class="fieldcontain">
					<span id="isClose-label" class="property-label"><g:message code="ticketV2.isClose.label" default="Is Close" /></span>
					
						<span class="property-value" aria-labelledby="isClose-label"><g:fieldValue bean="${ticketV2Instance}" field="isClose"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketV2Instance?.sentiment}">
				<li class="fieldcontain">
					<span id="sentiment-label" class="property-label"><g:message code="ticketV2.sentiment.label" default="Sentiment" /></span>
					
						<span class="property-value" aria-labelledby="sentiment-label"><g:fieldValue bean="${ticketV2Instance}" field="sentiment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketV2Instance?.subjectName}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="ticketV2.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${ticketV2Instance}" field="subjectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketV2Instance?.topicName}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="ticketV2.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:fieldValue bean="${ticketV2Instance}" field="topicName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ticketV2Instance?.id}" />
					<g:link class="edit" action="edit" id="${ticketV2Instance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
