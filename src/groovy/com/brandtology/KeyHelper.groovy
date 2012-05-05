package com.brandtology

class KeyHelper {

    def queryName

    public KeyHelper(queryName) {
        this.queryName = queryName
    }

    public String generateKey(clientAccountId, date, subjectId, sentiment){
        def dateStr
        if(date instanceof Date)
            dateStr = date.format("yyMMdd")
        else
            dateStr = date


        if(queryName == 'overview')
            return "${queryName}:${clientAccountId}:${subjectId}:${dateStr}:${sentiment}"

        else return ""
    }
}
