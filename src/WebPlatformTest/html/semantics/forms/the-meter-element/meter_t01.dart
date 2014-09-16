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

const String value='value';
const String expectedValue='expectedValue';
const String min='min';
const String max='max';
const String high='high';
const String low='low';
const String optimum='optimum';
const String expectedMin='expectedMin';
const String expectedMax='expectedMax';
const String expectedLow='expectedLow';
const String expectedHigh='expectedHigh';
const String expectedOptimum='expectedOptimum';
const String testname='testname';

void main() {

  var meters = [
    {value: 0, expectedValue: 0, expectedMin: 0, expectedMax: 1.0, expectedLow: 0, expectedHigh: 1.0, expectedOptimum: 0.5, testname: "Default values"},
    {value: 3, expectedValue: 3, min: -10.1, expectedMin: -10.1, max: 10.1, expectedMax: 10.1, low: -9.1, expectedLow: -9.1, high: 9.1, expectedHigh: 9.1, optimum: 3, expectedOptimum: 3, testname: "Setting values to min, max, low, high and optimum"},
//    {value: "foobar", expectedValue: 0, min: "foobar", expectedMin: 0, max: "foobar", expectedMax: 1.0, low: "foobar", expectedLow: 0, high: "foobar", expectedHigh: 1.0, optimum: "foobar", expectedOptimum: 0.5, testname: "Invalid floating-point number values"},
    {value: 0, expectedValue: 0, min: 0, expectedMin: 0, max: -1.0, expectedMax: 0, expectedLow: 0, expectedHigh: 0, expectedOptimum: 0, testname: "max < min"},
    {value: 0, expectedValue: 10, min: 10, expectedMin: 10, max: 20, expectedMax: 20, expectedLow: 10, expectedHigh: 20, expectedOptimum: 15, testname: "value < min"},
    {value: 30, expectedValue: 20, min: 10, expectedMin: 10, max: 20, expectedMax: 20, expectedLow: 10, expectedHigh: 20, expectedOptimum: 15, testname: "value > max"},
    {value: 15, expectedValue: 15, min: 10, expectedMin: 10, max: 20, expectedMax: 20, low: 5, expectedLow: 10, expectedHigh: 20, expectedOptimum: 15, testname: "low < min"},
    {value: 15, expectedValue: 15, min: 10, expectedMin: 10, max: 20, expectedMax: 20, low: 25, expectedLow: 20, expectedHigh: 20, expectedOptimum: 15, testname: "low > max"},
    {value: 15, expectedValue: 15, min: 10, expectedMin: 10, max: 20, expectedMax: 20, low: 12, expectedLow: 12, high: 10, expectedHigh: 12, expectedOptimum: 15, testname: "high < low"},
    {value: 15, expectedValue: 15, min: 10, expectedMin: 10, max: 20, expectedMax: 20, low: 10, expectedLow: 10, high: 22, expectedHigh: 20, expectedOptimum: 15, testname: "high > max"},
    {value: 15, expectedValue: 15, min: 10, expectedMin: 10, max: 20, expectedMax: 20, expectedLow: 10, expectedHigh: 20, optimum: 9, expectedOptimum: 10, testname: "optimum < min"},
    {value: 15, expectedValue: 15, min: 10, expectedMin: 10, max: 20, expectedMax: 20, expectedLow: 10, expectedHigh: 20, optimum: 21, expectedOptimum: 20, testname: "optimum > max"}
  ];
  
  for (var i = 0; i < meters.length; i++) {
    var m = meters[i];
    test(() {
      var meter = document.createElement("meter");
      meter.value = m[value];
      if (m[min]!=null) meter.min= m[min];
      if (m[max]!=null) meter.max = m[max];
      if (m[low]!=null) meter.low = m[low];
      if (m[high]) meter.high = m[high];
      if (m[optimum]) meter.optimum = m[optimum];
      assert_equals(meter.value, m[expectedValue], "meter value");
      assert_equals(meter.min, m[expectedMin], "min value");
      assert_equals(meter.max, m[expectedMax], "max value");
      assert_equals(meter.low, m[expectedLow], "low value");
      assert_equals(meter.high, m[expectedHigh], "high value");
      assert_equals(meter.optimum, m[expectedOptimum], "optimum value");
    }, m[testname]);
  }

  checkTestFailures();
}
