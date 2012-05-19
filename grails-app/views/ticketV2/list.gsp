
<%@ page import="grailsredis.TicketV2" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticketV2.label', default: 'TicketV2')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ticketV2" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ticketV2" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="channelCountry" title="${message(code: 'ticketV2.channelCountry.label', default: 'Channel Country')}" />
					
						<g:sortableColumn property="channelType" title="${message(code: 'ticketV2.channelType.label', default: 'Channel Type')}" />
					
						<g:sortableColumn property="datetimePost" title="${message(code: 'ticketV2.datetimePost.label', default: 'Datetime Post')}" />
					
						<g:sortableColumn property="isClose" title="${message(code: 'ticketV2.isClose.label', default: 'Is Close')}" />
					
						<g:sortableColumn property="sentiment" title="${message(code: 'ticketV2.sentiment.label', default: 'Sentiment')}" />
					
						<g:sortableColumn property="subject" title="${message(code: 'ticketV2.subjectName.label', default: 'Subject')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ticketV2InstanceList}" status="i" var="ticketV2Instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ticketV2Instance.id}">${fieldValue(bean: ticketV2Instance, field: "channelCountry")}</g:link></td>
					
						<td>${fieldValue(bean: ticketV2Instance, field: "channelType")}</td>
					
						<td>${fieldValue(bean: ticketV2Instance, field: "datetimePost")}</td>
					
						<td>${fieldValue(bean: ticketV2Instance, field: "isClose")}</td>
					
						<td>${fieldValue(bean: ticketV2Instance, field: "sentiment")}</td>
					
						<td>${fieldValue(bean: ticketV2Instance, field: "subjectName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ticketV2InstanceTotal}" />
			</div>
		</div>
	</body>
</html>
