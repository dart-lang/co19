/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test checks that invalid 'span' values are rejected. 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
    <table>
        <colgroup id="case1" span="10000000000">
            <th></th>
        </colgroup>
    </table>
    <table>
        <colgroup id="case2" span="0">
            <th></th>
        </colgroup>
    </table>
    <table>
        <colgroup id="case3" span="10000000000">
            <th></th>
        </colgroup>
    </table>
    <table>
        <colgroup id="case4" span="-10000000000">
            <th></th>
        </colgroup>
    </table>
    <table>
        <colgroup id="case5" span="Szeged">
            <th></th>
        </colgroup>
    </table>
    <table>
        <colgroup>
            <col id="case6" span="...">
       </colgroup>
    </table>
''';

void main() {
    description("This test checks that invalid 'span' values are rejected.");
    document.body.appendHtml(htmlEL2);
    // Remove "span" attribute (set it to null).
    document.getElementById("case1").attributes.remove("span");

    shouldBe(document.getElementById('case1').span, 1);
    shouldBe(document.getElementById('case2').span, 1);
    shouldBe(document.getElementById('case3').span, 1);
    shouldBe(document.getElementById('case4').span, 1);
    shouldBe(document.getElementById('case5').span, 1);
    shouldBe(document.getElementById('case6').span, 1);

    checkTestFailures();
}