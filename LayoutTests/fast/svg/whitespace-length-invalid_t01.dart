/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Whitespace in attribute values tests
 */
import "dart:html";
import "dart:math" as Math;
import "../../testharness.dart";
import "resources/whitespace-helper.dart";

const String htmlEL2 = r'''
<svg id="testcontainer">
    <defs>
        <marker/>
        <stop/>
        <filter>
            <feTurbulence></feTurbulence>
        </filter>
    </defs>
</svg>
<div id=log></div>
''';

var svg = document.querySelector("svg");

// test length values
double EPSILON = Math.pow(2, -24); // float epsilon
List<String>  whitespace = [ "", " ", "   ", "\r\n\t ", "\f" ];
List<String>  validunits = [ "", "em", "ex", "px", "in", "cm", "mm", "pt", "pc", "%" ];

// This test was split out from whitespace-length.html because the trybots were too slow.

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    testType("<length>",
		 svg,
		 "x",
		 0, // expected default value
		 whitespace,
		 [], // valid
		 [ double.nan.toString(), double.infinity.toString(), double.negativeInfinity.toString(), "fnord", "E", "e", "e+", "E-", "-", "+", "-.", ".-", ".", "+.", ".E0", "e1" ], // invalid
		 validunits,
		 [], // garbage
		 (elm, value) { assert_approx_equals(elm.x.baseVal.valueInSpecifiedUnits, double.parse(value), EPSILON); },
		 (elm, expected) { assert_approx_equals(elm.x.baseVal.value, expected, EPSILON); } );

    checkTestFailures();
}
