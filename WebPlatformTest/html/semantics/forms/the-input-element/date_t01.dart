/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/forms/the-input-element/date.html
 * @assertion
 *  <link rel="help" href="http://www.w3.org/html/wg/drafts/html/CR/forms.html#date-state-(type=date)">
 *  <link rel="help" href="http://www.w3.org/html/wg/drafts/html/CR/infrastructure.html#dates-and-times">
 * @description Inputs Date
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <h1>Inputs Date</h1>
    <div style="display: none">
      <input id="valid" type="date" value="2011-11-01" min="2011-01-01" max="2011-12-31" />
      <input id="too_small_value" type="date" value="1970-01-31" min="1-01-01" max="2011-12-31"/>
      <input id="too_large_value" type="date" value="2099-01-31" min="2011-01-01" max="2011-12-31"/>
      <input id="invalid_min" type="date" value="2011-01-01" min="not-a-date" max="2011-12-31"/>
      <input id="invalid_max" type="date" value="2011-01-01" min="2011-01-01" max="2011-13-162-777"/>
      <input id="min_larger_than_max" type="date" value="2011-01-01" min="2099-01" max="2011-12-31"/>
      <input id="invalid_value" type="date" value="invalid-date" min="2011-01-01" max="2011-12-31"/>
    </div>
''';

const String value = 'value';
const String expected = 'expected';
const String testname = 'testname';

void main() {
  document.body.appendHtml(htmlEL);
  InputElement valid = document.getElementById("valid");
  InputElement too_small_value = document.getElementById("too_small_value");
  InputElement too_large_value = document.getElementById("too_large_value");
  InputElement invalid_min = document.getElementById("invalid_min");
  InputElement invalid_max = document.getElementById("invalid_max");
  InputElement min_larger_than_max = document.getElementById("min_larger_than_max");
  InputElement invalid_value = document.getElementById("invalid_value");

  test(() {
    assert_equals(valid.type, "date");
  }, "date type support on input element");

  test(() {
    assert_equals(valid.value, "2011-11-01", "valid");
    assert_equals(too_small_value.value, "1970-01-31", "too_small_value");
    assert_equals(too_large_value.value, "2099-01-31", "too_large_value");
  }, "The value attribute, if specified and not empty, must have a value that is a valid date string.");

  test(() {
    assert_equals(valid.min, "2011-01-01", "valid");
    assert_equals(invalid_min.min, "",  "invalid_min");
  }, "The min attribute, if specified, must have a value that is a valid date string.");

  test(() {
    assert_equals(valid.max, "2011-12-31", "valid");
    assert_equals(min_larger_than_max.max, "2099-01", "min_larger_than_max");
    assert_equals(invalid_max.max, "", "invalid_max");
  },"The max attribute, if specified, must have a value that is a valid date string.");

  test(() {
    assert_equals(invalid_value.value, "");
  }, "User agents must not allow the user to set the value to a non-empty string that is not a valid date string.");
  
  test(() {
    var numDays = [
      // the number of days in month month of year year is: 31 if month is 1, 3, 5, 7, 8, 10, or 12;
      {value: "2014-01-31", expected: "2014-01-31", testname: "January has 31 days"},
      {value: "2014-01-32", expected: "", testname: "January has 31 days"},
      {value: "2014-03-31", expected: "2014-03-31", testname: "March has 31 days"},
      {value: "2014-03-32", expected: "", testname: "March has 31 days"},
      {value: "2014-05-31", expected: "2014-05-31", testname: "May has 31 days"},
      {value: "2014-05-32", expected: "", testname: "May has 31 days"},
      {value: "2014-07-31", expected: "2014-07-31", testname: "July has 31 days"},
      {value: "2014-07-32", expected: "", testname: "July has 31 days"},
      {value: "2014-08-31", expected: "2014-08-31", testname: "August has 31 days"},
      {value: "2014-08-32", expected: "", testname: "August has 31 days"},
      {value: "2014-10-31", expected: "2014-10-31", testname: "October has 31 days"},
      {value: "2014-10-32", expected: "", testname: "October has 31 days"},
      {value: "2014-12-31", expected: "2014-12-31", testname: "December has 31 days"},
      {value: "2014-12-32", expected: "", testname: "December has 31 days"},
      // the number of days in month month of year year is: 30 if month is 4, 6, 9, or 11;
      {value: "2014-04-30", expected: "2014-04-30", testname: "April has 30 days"},
      {value: "2014-04-31", expected: "", testname: "April has 30 days"},
      {value: "2014-06-30", expected: "2014-06-30", testname: "June has 30 days"},
      {value: "2014-06-31", expected: "", testname: "June has 30 days"},
      {value: "2014-09-30", expected: "2014-09-30", testname: "September has 30 days"},
      {value: "2014-09-31", expected: "", testname: "September has 30 days"},
      {value: "2014-11-30", expected: "2014-11-30", testname: "November has 30 days"},
      {value: "2014-11-31", expected: "", testname: "November has 30 days"},
      // leap years
      {value: "2014-02-28", expected: "2014-02-28", testname: "2014 is not a leap year: February has 28 days"},
      {value: "2014-02-29", expected: "", testname: "2014 is not a leap year: February has 28 days: value should be empty"},
      {value: "2016-02-29", expected: "2016-02-29", testname: "2016 is a leap year: February has 29 days"}
    ];
    for (var numDay in numDays) {
      var input = document.createElement("input") as InputElement;
      input.type = "date";
      input.value = numDay[value];
      assert_equals(input.value, numDay[expected], numDay[testname]);
    }
  }, "Number of days");

  checkTestFailures();
}
