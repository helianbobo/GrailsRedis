<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Redis</title>
    <meta name="layout" content="main">
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
        </fieldset>

        <fieldset class="buttons">
            <g:actionSubmit class="save" action="process" value="Process"/>
        </fieldset>
    </g:form>
</div>

<div>

</div>

</body>
</html>