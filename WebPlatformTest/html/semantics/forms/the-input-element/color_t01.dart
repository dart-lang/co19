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
 * after web-platform-tests/html/semantics/forms/the-input-element/color.html
 * @assertion
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/common-microsyntaxes.html#colors">
 * <link rel=help href="http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#color-state-(type=color)">
 * @description Form input type=color
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String value='value';
const String expected='expected';
const String testname='testname';

void main() {

  var colors = [
    {value: "", expected: "#000000", testname: "Empty value should return #000000"},
    {expected: "#000000", testname: "Missing value should return #000000"},
    {value: "#ffffff", expected: "#ffffff", testname: "Valid simple color: should return #ffffff"},
    {value: "#FFFFFF", expected: "#ffffff", testname: "Valid simple color (containing LATIN CAPITAL LETTERS): should return #ffffff (converted to ASCII lowercase)"},
    {value: "#0F0F0F", expected: "#0f0f0f", testname: "Zero-padding"},
    {value: "#fff", expected: "#000000", testname: "Invalid simple color: not 7 characters long"},
    {value: "fffffff", expected: "#000000", testname: "Invalid simple color: no starting # sign"},
    {value: "#gggggg", expected: "#000000", testname: "Invalid simple color: non ASCII hex digits"},
    {value: "foobar", expected: "#000000", testname: "Invalid simple color: foobar"},
    {value: "#ffffff\u0000", expected: "#000000", testname: "Invalid color: trailing Null (U+0000)"},
    {value: "#ffffff;", expected: "#000000", testname: "Invalid color: trailing ;"},
    {value: " #ffffff", expected: "#000000", testname: "Invalid color: leading space"},
    {value: "#ffffff ", expected: "#000000", testname: "Invalid color: trailing space"},
    {value: " #ffffff ", expected: "#000000", testname: "Invalid color: leading+trailing spaces"},
    {value: "crimson", expected: "#000000", testname: "Invalid color: keyword crimson"},
    {value: "bisque", expected: "#000000", testname: "Invalid color: keyword bisque"},
    {value: "currentColor", expected: "#000000", testname: "Invalid color: keyword currentColor"},
    {value: "transparent", expected: "#000000", testname: "Invalid color: keyword transparent"},
    {value: "ActiveBorder", expected: "#000000", testname: "Invalid color: keyword ActiveBorder"},
    {value: "inherit", expected: "#000000", testname: "Invalid color: keyword inherit"},
    {value: "rgb(1,1,1)", expected: "#000000", testname: "Invalid color: rgb(1,1,1)"},
    {value: "rgb(1,1,1,1)", expected: "#000000", testname: "Invalid color: rgb(1,1,1,1)"},
    {value: "#FFFFF\u1F4A9", expected: "#000000", testname: "Invalid color: PILE OF POO (U+1F4A9)"}
  ];
  for (var i = 0; i < colors.length; i++) {
    var w = colors[i];
    test(() {
      var input = document.createElement("input") as InputElement;
      input.type = "color";
      input.value = w[value];
      assert_equals(input.value, w[expected]);
    }, w[testname]);
  }

  checkTestFailures();
}
