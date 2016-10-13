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
 * after web-platform-tests/html/semantics/forms/the-input-element/week.html
 * @assertion
 * <link rel=help href="http://www.w3.org/html/wg/drafts/html/CR/infrastructure.html#weeks">
 * <link rel=help href="http://www.w3.org/html/wg/drafts/html/CR/forms.html#week-state-(type=week)">
 * @description Form input type=week
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String VALUE = 'value';
const String EXPECTED = 'expected';
const String TESTNAME = 'testname';
const String ATTRIBUTES = 'attributes';
const String MIN = 'min';
const String MAX = 'max';

const String htmlEL='''
''';

void main() {
  document.body.appendHtml(htmlEL);

  var weeks = [
    {VALUE: "", EXPECTED: "", TESTNAME: "empty value"},
    {VALUE: "2014-W52", EXPECTED: "2014-W52", TESTNAME: "Valid value: Value should be 2014-W52"},
    {VALUE: "2014-W53", EXPECTED: "", TESTNAME: "2014 has 52 weeks: Value should be empty"},
    {VALUE: "2015-W53", EXPECTED: "2015-W53", TESTNAME: "2015 has 53 weeks: Value should be 2015-W53"},
    {VALUE: "2014", EXPECTED: "", TESTNAME: "Invalid value: year only"},
    {VALUE: "2014W", EXPECTED: "", TESTNAME: "Invalid value: no week number"},
    {VALUE: "2014W52", EXPECTED: "", TESTNAME: "Invalid value: no '-' (U+002D)"},
    {VALUE: "-W52", EXPECTED: "", TESTNAME: "Invalid value: yearless week"},
    {VALUE: "W52", EXPECTED: "", TESTNAME: "Invalid value: yearless week and no '-' (U+002D)"},
    {VALUE: "2014-W03", ATTRIBUTES: { MIN: "2014-W02" }, EXPECTED: "2014-W03", TESTNAME: "Value >= min attribute"},
    {VALUE: "2014-W01", ATTRIBUTES: { MIN: "2014-W02" }, EXPECTED: "2014-W02", TESTNAME: "Value < min attribute"},
    {VALUE: "2014-W10", ATTRIBUTES: { MAX: "2014-W11" }, EXPECTED: "2014-W10", TESTNAME: "Value <= max attribute"},
    {VALUE: "2014-W12", ATTRIBUTES: { MAX: "2014-W11" }, EXPECTED: "2014-W11", TESTNAME: "Value > max attribute"}
  ];

  for (var i = 0; i < weeks.length; i++) {
    var w = weeks[i];
    test(() {
      var input = document.createElement("input") as InputElement;
      input.type = "week";
      input.value = w[VALUE];
      var attrs = w[ATTRIBUTES] as Map;
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


