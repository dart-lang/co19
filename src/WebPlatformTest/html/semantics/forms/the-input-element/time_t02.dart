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
 * after web-platform-tests/html/semantics/forms/the-input-element/time-2.html
 * @assertion
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/common-microsyntaxes.html#times">
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#time-state-(type=time)">
 * @description Form input type=time
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
  var times = [
    {value: "", expected: "", testname: "empty value"},
    {value: "00:00", expected: "00:00", testname: "Valid value: value should be 00:00"},
    {value: "00:00:00", expected: "00:00:00", testname: "Valid value: value should be 00:00:00"},
    {value: "00:00:00.0", expected: "00:00:00.0", testname: "Valid value: value should be 00:00:00.0"},
    {value: "00:00:00.00", expected: "00:00:00.00", testname: "Valid value: value should be 00:00:00.00"},
    {value: "00:00:00.000", expected: "00:00:00.000", testname: "Valid value: value should be 00:00:00.000"},
    {value: "00:00:00.0000", expected: "", testname: "Invalid value: fraction should have one, two or three ASCII digits. Value should be empty"},
    {value: "0:00:00.000", expected: "", testname: "Invalid value: hour should have two ASCII digits. Value should be empty"},
    {value: "00:0:00.000", expected: "", testname: "Invalid value: minutes should have two ASCII digits. Value should be empty"},
    {value: "00:00:0.000", expected: "", testname: "Invalid value: seconds should have two ASCII digits. Value should be empty"},
    {value: "24:00:00.000", expected: "", testname: "Invalid value: hour > 23. Value should be empty"},
    {value: "00:60:00.000", expected: "", testname: "Invalid value: minute > 59. Value should be empty"},
    {value: "00:00:60.000", expected: "", testname: "Invalid value: second > 59. Value should be empty"},
    {value: "12:00:00.001", attributes: { min: "12:00:00.000" }, expected: "12:00:00.001", testname: "Value >= min attribute"},
    {value: "12:00:00.000", attributes: { min: "12:00:00.001" }, expected: "12:00:00.001", testname: "Value < min attribute"},
    {value: "12:00:00.000", attributes: { max: "12:00:00.001" }, expected: "12:00:00.000", testname: "Value <= max attribute"},
    {value: "12:00:00.001", attributes: { max: "12:00:00.000" }, expected: "12:00:00.000", testname: "Value > max attribute"}
  ];
  for (var i = 0; i < times.length; i++) {
    var w = times[i];
    test(() {
      var input = document.createElement("input");
      input.type = "time";
      input.value = w[value];
      var attrs = w[attributes];
      if (attrs != null) {
        for (var attrName in attrs.keys) {
          input.setAttribute(attrName, w[attributes][attrName]);
        }
      }
      assert_equals(input.value, w[expected]);
    }, w[testname]);
  }

  checkTestFailures();
}

