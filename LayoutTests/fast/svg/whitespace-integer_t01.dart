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
var EPSILON = Math.pow(2, -24); // float epsilon
var whitespace = [ "", " ", "   ", "\r\n\t ", "\f" ];
var garbage = [ "a", "e", "foo", ")90" ];
var validunits = [ "", "em", "ex", "px", "in", "cm", "mm", "pt", "pc", "%" ];

void main() {
    document.body.appendHtml(htmlEL2);

    testType("<integer>",
         document.getElementsByTagName("feTurbulence")[0], // workaround for broken querySelector on camelcased elements
		 "numOctaves",
		 0, // expected default value (FIXME: should be 1)
		 whitespace,
		 [ "-47", "0", "+32", "1241245" ],
		 [ double.NAN, double.INFINITY, double.NEGATIVE_INFINITY, "fnord", "E", "e", "e+", "E-", "-", "+", "-.", ".-", ".", "+.", ".E0", "e1", "+17E-1", "17e+2", "0.35", "1e-10", ".1" ],
		 [""], // valid units
		 garbage,
		 (elm, value) { assert_equals(elm.numOctaves.baseVal, int.parse(value)); },
		 (elm, expected) { assert_equals(elm.numOctaves.baseVal, expected); } );
    checkTestFailures();
}
