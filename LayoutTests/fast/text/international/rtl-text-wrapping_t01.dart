/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for CJK segmentation
 */
import "dart:html";
import "../../../testharness.dart";

const String htmlEL1 = r'''
        <meta charset="utf8">
        <style>
            div  {
                font-size: 24pt;
                border: 1px solid silver;
                margin: 5px;
            }
            section {
                position: relative;
                padding: 0;
            }
        </style>
''';

const String htmlEL2 = r'''
        <section id="test">
            <div style="position: absolute; left: 200px;">[به کبند</div>
            <div style="display: inline-block;">[به کبند</div><br>
            <div class="reference" style="display: inline-block; white-space: nowrap;">[به کبند</div>
        </section>
        <p>
            The three blocks above should all be the same size and none
            of them should wrap.
        </p>
        <section id="test-rtl">
            <div dir="rtl" style="position: absolute; left: 200px;">[به کبند</div>
            <div dir="rtl" style="display: inline-block;">[به کبند</div><br>
            <div dir="rtl" class="reference" style="display: inline-block; white-space: nowrap;">[به کبند</div>
        </section>
        <p>
            The three blocks above should all be the same size and none
            of them should wrap.
        </p>
''';

void testSection(id) {
    var el = document.getElementById(id);
    var testElements = el.queryAll('div');
    var referenceHeight = el.getElementsByClassName('reference')[0].
        getBoundingClientRect().height;

    for (var i = 0; i < testElements.length; i++) {
        var el = testElements[i];
        var height = el.getBoundingClientRect().height;
        shouldBe(height, referenceHeight, "$id[$i]");
    }
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    testSection('test');
    testSection('test-rtl');
    checkTestFailures();
}
