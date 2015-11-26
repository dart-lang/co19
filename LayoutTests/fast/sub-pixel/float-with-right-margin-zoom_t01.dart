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
        body {
            zoom: 125%;
        }
        .logo {
            float: left;
        }
        .logo > div {
            float: left;
            width: 50px;
            height: 50px;
            margin: 10px 10px 0 0;
        }
        .section-info {
            background-color: blue;
        }
        .section-logo {
            position: relative;
            background-color: green;

        }
    </style>
''';

const String htmlEL2 = r'''
    <p>
        Both elements below should be on the same line.
    </p>
    <div id="test" class="logo">
        <div class="section-info"></div>
        <div class="section-logo"></div>
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var elements = document.getElementById('test').querySelectorAll('div');
    Expect.equals(elements[0].getBoundingClientRect().top, elements[1].getBoundingClientRect().top);
}
