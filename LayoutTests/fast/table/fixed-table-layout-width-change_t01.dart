/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
        <style>
            #outer {
                display: table;
                table-layout: fixed;
            }
            #inner {
                display: table-cell;
                height: 50px;
                background-color: green;
                min-width: 200px;
            }
        </style>
''';

const String htmlEL2 = r'''
        Tests that the table width having table-layout fixed changes when width is changed dynamically.
        <div id="outer" data-expected-width="100">
            <div id="inner"></div>
        </div>
        <div id="test-output"></div>
''';

void runTest(e) {
    var outer = document.getElementById('outer');
    outer.style.width = '100px';
    checkLayout("#outer", document.getElementById("test-output"));
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener(runTest);
}
