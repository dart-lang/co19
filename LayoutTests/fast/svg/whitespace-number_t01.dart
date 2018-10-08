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

// test length values
double EPSILON = Math.pow(2, -24); // float epsilon
List<String> whitespace = [ "", " ", "   ", "\r\n\t ", "\f" ];
List<String> garbage = [ "a", "e", "foo", ")90" ];

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    testType("<number>",
		 document.querySelector("stop"),
		 "offset",
		 0, // expected default value
		 whitespace,
		 [ "-47", ".1", "0.35", "1e-10", "+32", "+17E-1", "17e+2" ], // valid
		 [ double.nan.toString(), double.infinity.toString(), double.negativeInfinity.toString(), "fnord", "E", "e", "e+", "E-", "-", "+", "-.", ".-", ".", "+.", ".E0", "e1" ], // invalid
		 [ "" ], // valid units
         garbage,
		 (elm, value) { assert_approx_equals(elm.gradientOffset.baseVal, double.parse(value), EPSILON); },
		 (elm, expected) { assert_approx_equals(elm.gradientOffset.baseVal, expected, EPSILON); } );

    testType("<percentage>",
		 document.querySelector("stop"),
		 "offset",
		 0, // expected default value
		 whitespace,
		 [ "-47", ".1", "0.35", "1e-10", "+32", "+17E-1", "17e+2" ], // valid
		 [ double.nan.toString(), double.infinity.toString(), double.negativeInfinity.toString(), "fnord", "E", "e", "e+", "E-", "-", "+", "-.", ".-", ".", "+.", ".E0", "e1" ], // invalid
		 [ "%" ], // valid units
		 garbage,
		 (elm, value) {
		    assert_approx_equals(elm.gradientOffset.baseVal, double.parse(value)/ 100, EPSILON);
		 },
		 (elm, expected) { assert_approx_equals(elm.gradientOffset.baseVal, expected, EPSILON); } );

    checkTestFailures();
}
