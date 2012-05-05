
<%@ page import="grailsredis.Ticket" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ticket" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="datetimeCreated" title="${message(code: 'ticket.datetimeCreated.label', default: 'Datetime Created')}" />
					
						<g:sortableColumn property="datetimePosted" title="${message(code: 'ticket.datetimePosted.label', default: 'Datetime Posted')}" />
					
						<g:sortableColumn property="datetimeStatus" title="${message(code: 'ticket.datetimeStatus.label', default: 'Datetime Status')}" />
					
						<g:sortableColumn property="qualityIssueBy" title="${message(code: 'ticket.qualityIssueBy.label', default: 'Quality Issue By')}" />
					
						<g:sortableColumn property="qualityCheckedBy" title="${message(code: 'ticket.qualityCheckedBy.label', default: 'Quality Checked By')}" />
					
						<g:sortableColumn property="ticketClosedBy" title="${message(code: 'ticket.ticketClosedBy.label', default: 'Ticket Closed By')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "datetimeCreated")}</g:link></td>
					
						<td><g:formatDate date="${ticketInstance.datetimePosted}" /></td>
					
						<td><g:formatDate date="${ticketInstance.datetimeStatus}" /></td>
					
						<td>${fieldValue(bean: ticketInstance, field: "qualityIssueBy")}</td>
					
						<td>${fieldValue(bean: ticketInstance, field: "qualityCheckedBy")}</td>
					
						<td>${fieldValue(bean: ticketInstance, field: "ticketClosedBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ticketInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
