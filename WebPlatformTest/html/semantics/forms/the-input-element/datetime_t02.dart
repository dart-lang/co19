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
 * after web-platform-tests/html/semantics/forms/the-input-element/datetime-2.html
 * @assertion
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/common-microsyntaxes.html#global-dates-and-times">
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#local-date-and-time-state-(type=datetime)">
 * @description Form input type=datetime
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String value='value';
const String attributes='attributes';
const String expected='expected';
const String testname='testname';
const String min='min';
const String max='max';

void main() {

  var datetime = [
    // valid values
    {value: "", expected: "", testname: "empty value"},
    {value: "2014-01-01T11:11Z", expected: "2014-01-01T11:11Z", testname: "datetime input value set to 2014-01-01T11:11Z without min/max"},
    {value: "2014-01-01 11:11Z", expected: "2014-01-01T11:11Z", testname: "datetime input value set to 2014-01-01 11:11Z without min/max"},
    {value: "2014-01-01 11:11-04:00", expected: "2014-01-01T15:11Z", testname: "datetime input value set to 2014-01-01 11:11-04:00 without min/max"},
    {value: "2014-01-01 11:11-0400", expected: "2014-01-01T15:11Z", testname: "datetime input value set to 2014-01-01 11:11-0400 without min/max"},
    {value: "2014-01-01 11:11:00.000-04:00", expected: "2014-01-01T15:11Z", testname: "datetime input value set to 2014-01-01 11:11:00.000-04:00 without min/max"},
    // invalid values
    {value: "2014-01-01  11:11:00.000Z", expected: "", testname: "datetime input value set to 2014-01-01  11:11:00.000Z without min/max"},
    {value: "2014-01-01 11:11:00.000", expected: "", testname: "datetime input value set to 2014-01-01 11:11:00.000 without min/max"},
    {value: "2014-01-01 11:11:00.000+", expected: "", testname: "datetime input value set to 2014-01-01 11:11:00.000+ without min/max"},
    {value: "2014-01-01 11:11:00.000+24", expected: "", testname: "datetime input value set to 2014-01-01 11:11:00.000+24 without min/max"},
    {value: "2014-01-01 11:11:00.000+2360", expected: "", testname: "datetime input value set to 2014-01-01 11:11:00.000+2360 without min/max"},
    {value: "2014-01-0 11:11:00.000+0400", expected: "", testname: "datetime input value set to 2014-01-0 11:11:00.000+0400 without min/max"},
    {value: "2014-01-01 11:1:00.000+0400", expected: "", testname: "datetime input value set to 2014-01-01 11:1:00.000+0400 without min/max"},
    // min/max
    {value: "2014-01-01 11:11Z", attributes: { min: "2014-01-01T11:10Z" }, expected: "2014-01-01T11:11Z", testname: "Value >= min attribute"},
    {value: "2014-01-01 11:10Z", attributes: { min: "2014-01-01T11:11Z" }, expected: "2014-01-01T11:11Z", testname: "Value < min attribute"},
    {value: "2014-01-01 11:10Z", attributes: { max: "2014-01-01T11:11Z" }, expected: "2014-01-01T11:11Z", testname: "Value <= max attribute"},
    {value: "2014-01-01 11:11Z", attributes: { max: "2014-01-01T11:10Z" }, expected: "2014-01-01T11:10Z", testname: "Value > max attribute"}
  ];
  
  for (Map w in datetime) {
    test(() {
      var input = document.createElement("input");
      input.type = "datetime";
      input.value = w[value];
      Map attrs=w[attributes]; 
      if (attrs!=null) {
        for (var attrName in attrs.keys) {
          input.attributes[attrName] = attrs[attrName];
        }
      }
      assert_equals(input.value, w[expected]);
    }, w[testname]);
  }

  checkTestFailures();
}
