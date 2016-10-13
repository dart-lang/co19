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

const String VALUE = 'value';
const String ATTRIBUTES = 'attributes';
const String EXPECTED = 'expected';
const String TESTNAME = 'testname';
const String MIN = 'min';
const String MAX = 'max';

void main() {
  var times = [
    {VALUE: "", EXPECTED: "", TESTNAME: "empty value"},
    {VALUE: "00:00", EXPECTED: "00:00", TESTNAME: "Valid value: value should be 00:00"},
    {VALUE: "00:00:00", EXPECTED: "00:00:00", TESTNAME: "Valid value: value should be 00:00:00"},
    {VALUE: "00:00:00.0", EXPECTED: "00:00:00.0", TESTNAME: "Valid value: value should be 00:00:00.0"},
    {VALUE: "00:00:00.00", EXPECTED: "00:00:00.00", TESTNAME: "Valid value: value should be 00:00:00.00"},
    {VALUE: "00:00:00.000", EXPECTED: "00:00:00.000", TESTNAME: "Valid value: value should be 00:00:00.000"},
    {VALUE: "00:00:00.0000", EXPECTED: "", TESTNAME: "Invalid value: fraction should have one, two or three ASCII digits. Value should be empty"},
    {VALUE: "0:00:00.000", EXPECTED: "", TESTNAME: "Invalid value: hour should have two ASCII digits. Value should be empty"},
    {VALUE: "00:0:00.000", EXPECTED: "", TESTNAME: "Invalid value: minutes should have two ASCII digits. Value should be empty"},
    {VALUE: "00:00:0.000", EXPECTED: "", TESTNAME: "Invalid value: seconds should have two ASCII digits. Value should be empty"},
    {VALUE: "24:00:00.000", EXPECTED: "", TESTNAME: "Invalid value: hour > 23. Value should be empty"},
    {VALUE: "00:60:00.000", EXPECTED: "", TESTNAME: "Invalid value: minute > 59. Value should be empty"},
    {VALUE: "00:00:60.000", EXPECTED: "", TESTNAME: "Invalid value: second > 59. Value should be empty"},
    {VALUE: "12:00:00.001", ATTRIBUTES: { MIN: "12:00:00.000" }, EXPECTED: "12:00:00.001", TESTNAME: "Value >= min attribute"},
    {VALUE: "12:00:00.000", ATTRIBUTES: { MIN: "12:00:00.001" }, EXPECTED: "12:00:00.001", TESTNAME: "Value < min attribute"},
    {VALUE: "12:00:00.000", ATTRIBUTES: { MAX: "12:00:00.001" }, EXPECTED: "12:00:00.000", TESTNAME: "Value <= max attribute"},
    {VALUE: "12:00:00.001", ATTRIBUTES: { MAX: "12:00:00.000" }, EXPECTED: "12:00:00.000", TESTNAME: "Value > max attribute"}
  ];
  for (var i = 0; i < times.length; i++) {
    var w = times[i];
    test(() {
      var input = document.createElement("input") as InputElement;
      input.type = "time";
      input.value = w[VALUE];
      var attrs = w[ATTRIBUTES] as Map<String, String>;
      if (attrs != null) {
        for (var attrName in attrs.keys) {
          input.setAttribute(attrName, attrs[attrName]);
        }
      }
      assert_equals(input.value, w[EXPECTED]);
    }, w[TESTNAME]);
  }

  checkTestFailures();
}

