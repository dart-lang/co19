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
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
    <style>
        #scroll {
            width: 200px;
            height: 200px;
            overflow: scroll;
            border: 1px solid black;
        }
        
        #transform {
            width: 100px;
            height: 100px;
            background-color: green;
            -webkit-transform: translateY(150px);
        }
    </style>
''';

const String htmlEL2 = r'''
    <p id="result">
        FAIL. The transform has not been applied to the scrollHeight.
    </p>

    <div id="scroll">
        <div id="transform"></div>
    </div>
''';

void runTest(e) {
    document.body.offsetWidth;
    var elt = document.elementFromPoint(130, 130);
    Expect. equals(document.getElementById('progress'), elt);
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var scroll = document.getElementById("scroll");
    var scrollHeight = scroll.scrollHeight;
    Expect.isTrue(scrollHeight > 200, "The transform was not applied to the scrollHeight!");
    var result = document.getElementById("result");
    result.text = "SUCCESS! The transform was applied to the scrollHeight!";
}
