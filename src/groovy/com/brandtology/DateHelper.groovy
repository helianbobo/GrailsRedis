package com.brandtology

import java.text.SimpleDateFormat

class DateHelper {
    Date from
    Date to

    public DateHelper(Date from, Date to) {
        this.from = from
        this.to = to
        if(from.after(to))
            throw new Exception("from date must less than or equal to date")
    }

    public Set generateByDay(){
        def result = new HashSet<String>()
        def temp = new Date(from.time)

        SimpleDateFormat format = new SimpleDateFormat('yyMMdd')

        result.add(format.format(from))

        while (temp.before(to)){
            temp = temp.plus(1)
            result << format.format(temp)
        }

        return result
    }
}
