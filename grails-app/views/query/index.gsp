<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Redis</title>
    <meta name="layout" content="main">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'highcharts.js')}"></script>
</head>

<body>

<div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form>
        <fieldset class="form">
            <div class="fieldcontain">
                <label for="from_date">From</label>
                <g:datePicker name="from_date" value="${new java.util.Date().minus(2)}" precision="day"/>
            </div>

            <div class="fieldcontain">
                <label for="to_date">To</label>
                <g:datePicker name="to_date" value="${new java.util.Date().minus(1)}" precision="day"/>
            </div>

            <div class="fieldcontain">
                <label for="sentiment">Sentiment</label>
                <g:textField name="sentiment" value="P,VP"/>
            </div>

            <div class="fieldcontain">
                <label for="clientAccountId">Client</label>
                <g:textField name="clientAccountId" value="733"/>
            </div>

            <div class="fieldcontain">
                <label for="subjectId">Subject</label>
                <g:textField name="subjectId" value="27065,27066,27067,27068,27069"/>
            </div>
        </fieldset>

        <fieldset class="buttons">
            <g:actionSubmit class="save" action="query" value="query"/>
        </fieldset>
    </g:form>
</div>

<div>

</div>

</body>
</html>