/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Whitespace in <angle> attribute values
 */
import "dart:html";
import "dart:math" as Math;
import "../../testharness.dart";
import "resources/whitespace-helper.dart";

const String htmlEL2 = r'''
<svg id="testcontainer">
    <defs>
        <marker/>
    </defs>
</svg>
<div id=log></div>
''';

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    double EPSILON = Math.pow(2, -24); // float epsilon
    List<String>  whitespace = [ "", " ", "   ", "\r\n\t ", "\f" ];
    List<String>  garbage = [ "a", "e", "foo", ")90" ];

    testType("<angle>",
             document.querySelector("marker"),
             "orient",
             0, // expected default value
             whitespace,
             [ "-47", ".1", "0.35", "1e-10", "+32", "+17E-1", "17e+2" ], // valid
             [ double.nan.toString(), double.infinity.toString(), double.negativeInfinity.toString(), "fnord", "E", "e", "e+", "E-", "-", "+", "-.", ".-", ".", "+.", ".E0", "e1" ], // invalid
             [ "", "deg", "rad", "grad" ], // valid units
             garbage,
             (elm, value) {
                 assert_approx_equals(elm.orientAngle.baseVal.valueInSpecifiedUnits,
                      double.parse(value), EPSILON);
             },
             (elm, expected) {
                 assert_approx_equals(elm.orientAngle.baseVal.value,
                 expected, EPSILON); }
              );

    checkTestFailures();
}
