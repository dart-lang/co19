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

Element svg = document.querySelector("svg");

// test length values
double EPSILON = Math.pow(2, -24); // float epsilon
List<String> whitespace = [ "", " ", "   ", "\r\n\t ", "\f" ];
List<String> garbage = [ "a", "e", "foo", ")90" ];
List<String> validunits = [ "", "em", "ex", "px", "in", "cm", "mm", "pt", "pc", "%" ];

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    testType("<length>",
		 svg,
		 "x",
		 0, // expected default value
		 whitespace,
		 [ "-47", ".1", "0.35", "1e-10", "+32", "+17E-1", "17e+2" ], // valid
		 [], // invalid (split out the next line to whitespace-length-invalid.html because trybots were too slow )
		     // [ double.nan, double.infinity, double.negativeInfinity, "fnord", "E", "e", "e+", "E-", "-", "+", "-.", ".-", ".", "+.", ".E0", "e1" ],
		 validunits,
		 garbage,
		 (elm, value) { assert_approx_equals(elm.x.baseVal.valueInSpecifiedUnits, double.parse(value), EPSILON); },
		 (elm, expected) { assert_approx_equals(elm.x.baseVal.value, expected, EPSILON); } );

    checkTestFailures();
}
