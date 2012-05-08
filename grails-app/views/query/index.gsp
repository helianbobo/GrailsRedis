<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Redis</title>
    <meta name="layout" content="main">
    <r:require module="query"/>
</head>

<body>

<div>

    <script type="text/javascript">
        function renderChart(data) {
            new Highcharts.Chart({
                chart:{
                    renderTo:'chart',
                    defaultSeriesType:'bar',
                    zoomType:'x'
                },
                title:{
                    text:'',
                    x:-20 //center
                },

                xAxis:{
                    categories:data.xAxis
                },
                yAxis:{
                    title:{
                        text:'Buzz'
                    },
                    plotLines:[
                        {
                            value:0,
                            width:1,
                            color:'#808080'
                        }
                    ]
                },
                tooltip:{
                    formatter:function () {
                        return '<b>' + this.series.name + '</b><br/>' +
                                this.x + ': ' + this.y + '';
                    }
                },

                plotOptions:{
                    series:{
                        stacking:'normal',

                        /* trigger dialog event*/
                        enableMouseTracking:true,
                        point:{
                            enableMouseTracking:true,
                            events:{
                                click:function (event) {

                                }
                            }
                        }

                    }
                },
                legend:{
                    borderWidth:0
                },

                series:data.series
            });
        }
    </script>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:formRemote url="[action: 'query']" name="queryForm" onSuccess="renderChart(data)" asynchronous="true">
        <fieldset class="form">
            <div class="fieldcontain">
                <label for="from_date">From</label>
                <g:datePicker name="from_date" value="${new java.util.Date(112,2,1)}" precision="day"/>
            </div>

            <div class="fieldcontain">
                <label for="to_date">To</label>
                <g:datePicker name="to_date" value="${new java.util.Date(112,2,31)}" precision="day"/>
            </div>

            <div class="fieldcontain">
                <label for="sentiment">Sentiment</label>
                <g:textField name="sentiment" value="VP,P,NE,N,VN"/>
            </div>

            <div class="fieldcontain">
                <label for="clientAccountId">Client</label>
                <g:textField name="clientAccountId" value="733"/>
            </div>

            <div class="fieldcontain">
                <label for="subjectId">Subject</label>
                <g:textField name="subjectId" value="27070,27071,27072,27073,27074,34978,36009"/>
            </div>
        </fieldset>

        <fieldset class="buttons">
            <input value="Query" type="submit" class="save"/>
            %{--<g:actionSubmit class="save" action="query" value="query"/>--}%
        </fieldset>
    </g:formRemote>
</div>

<div id="chart">

</div>

</body>
</html>