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
 * after web-platform-tests/html/semantics/forms/the-meter-element/meter.html
 * @assertion
 * http://www.whatwg.org/specs/web-apps/current-work/multipage/the-button-element.html#the-meter-element
 * @description The meter element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String VALUE = 'value';
const String EXPECTED_VALUE = 'expectedValue';
const String MIN = 'min';
const String MAX = 'max';
const String HIGH = 'high';
const String LOW = 'low';
const String OPTIMUM = 'optimum';
const String EXPECTED_MIN = 'expectedMin';
const String EXPECTED_MAX = 'expectedMax';
const String EXPECTED_LOW = 'expectedLow';
const String EXPECTED_HIGH = 'expectedHigh';
const String EXPECTED_OPTIMUM = 'expectedOptimum';
const String TESTNAME = 'testname';

void main() {

  var meters = [
    {VALUE: 0, EXPECTED_VALUE: 0, EXPECTED_MIN: 0, EXPECTED_MAX: 1.0, EXPECTED_LOW: 0, EXPECTED_HIGH: 1.0, EXPECTED_OPTIMUM: 0.5, TESTNAME: "Default values"},
    {VALUE: 3, EXPECTED_VALUE: 3, MIN: -10.1, EXPECTED_MIN: -10.1, MAX: 10.1, EXPECTED_MAX: 10.1, LOW: -9.1, EXPECTED_LOW: -9.1, HIGH: 9.1, EXPECTED_HIGH: 9.1, OPTIMUM: 3, EXPECTED_OPTIMUM: 3, TESTNAME: "Setting values to min, max, low, high and optimum"},
//    {value: "foobar", expectedValue: 0, min: "foobar", expectedMin: 0, max: "foobar", expectedMax: 1.0, low: "foobar", expectedLow: 0, high: "foobar", expectedHigh: 1.0, optimum: "foobar", expectedOptimum: 0.5, testname: "Invalid floating-point number values"},
    {VALUE: 0, EXPECTED_VALUE: 0, MIN: 0, EXPECTED_MIN: 0, MAX: -1.0, EXPECTED_MAX: 0, EXPECTED_LOW: 0, EXPECTED_HIGH: 0, EXPECTED_OPTIMUM: 0, TESTNAME: "max < min"},
    {VALUE: 0, EXPECTED_VALUE: 10, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, EXPECTED_LOW: 10, EXPECTED_HIGH: 20, EXPECTED_OPTIMUM: 15, TESTNAME: "value < min"},
    {VALUE: 30, EXPECTED_VALUE: 20, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, EXPECTED_LOW: 10, EXPECTED_HIGH: 20, EXPECTED_OPTIMUM: 15, TESTNAME: "value > max"},
    {VALUE: 15, EXPECTED_VALUE: 15, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, LOW: 5, EXPECTED_LOW: 10, EXPECTED_HIGH: 20, EXPECTED_OPTIMUM: 15, TESTNAME: "low < min"},
    {VALUE: 15, EXPECTED_VALUE: 15, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, LOW: 25, EXPECTED_LOW: 20, EXPECTED_HIGH: 20, EXPECTED_OPTIMUM: 15, TESTNAME: "low > max"},
    {VALUE: 15, EXPECTED_VALUE: 15, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, LOW: 12, EXPECTED_LOW: 12, HIGH: 10, EXPECTED_HIGH: 12, EXPECTED_OPTIMUM: 15, TESTNAME: "high < low"},
    {VALUE: 15, EXPECTED_VALUE: 15, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, LOW: 10, EXPECTED_LOW: 10, HIGH: 22, EXPECTED_HIGH: 20, EXPECTED_OPTIMUM: 15, TESTNAME: "high > max"},
    {VALUE: 15, EXPECTED_VALUE: 15, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, EXPECTED_LOW: 10, EXPECTED_HIGH: 20, OPTIMUM: 9, EXPECTED_OPTIMUM: 10, TESTNAME: "optimum < min"},
    {VALUE: 15, EXPECTED_VALUE: 15, MIN: 10, EXPECTED_MIN: 10, MAX: 20, EXPECTED_MAX: 20, EXPECTED_LOW: 10, EXPECTED_HIGH: 20, OPTIMUM: 21, EXPECTED_OPTIMUM: 20, TESTNAME: "optimum > max"}
  ];
  
  for (var i = 0; i < meters.length; i++) {
    var m = meters[i];
    test(() {
      var meter = document.createElement("meter") as MeterElement;
      meter.value = m[VALUE];
      if (m[MIN] != null) meter.min= m[MIN];
      if (m[MAX] != null) meter.max = m[MAX];
      if (m[LOW] != null) meter.low = m[LOW];
      if (m[HIGH]) meter.high = m[HIGH];
      if (m[OPTIMUM]) meter.optimum = m[OPTIMUM];
      assert_equals(meter.value, m[EXPECTED_VALUE], "meter value");
      assert_equals(meter.min, m[EXPECTED_MIN], "min value");
      assert_equals(meter.max, m[EXPECTED_MAX], "max value");
      assert_equals(meter.low, m[EXPECTED_LOW], "low value");
      assert_equals(meter.high, m[EXPECTED_HIGH], "high value");
      assert_equals(meter.optimum, m[EXPECTED_OPTIMUM], "optimum value");
    }, m[TESTNAME]);
  }

  checkTestFailures();
}
