modules = {
    application {
        resource url:'js/application.js'
    }

    query{
        dependsOn 'jquery'
        resource url: 'js/highcharts.js'
    }
}