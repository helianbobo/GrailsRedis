package com.brandtology

import java.text.SimpleDateFormat

class DateHelperTest extends GroovyTestCase {
    void testGenerateByDay() {

        SimpleDateFormat format = new SimpleDateFormat('yyMMdd')
        def from = format.parse('120401')
        def to = format.parse('120404')

        DateHelper helper = new DateHelper(from, to)

        Set expected = new HashSet()
        expected.add('120401')
        expected.add('120402')
        expected.add('120403')
        expected.add('120404')

        assertEquals(expected ,helper.generateByDay())
    }

    void testGenerateByDaySameDate() {

        SimpleDateFormat format = new SimpleDateFormat('yyMMdd')
        def from = format.parse('120401')
        def to = format.parse('120401')

        DateHelper helper = new DateHelper(from, to)

        Set expected = new HashSet()
        expected.add('120401')

        assertEquals(expected ,helper.generateByDay())
    }
}
