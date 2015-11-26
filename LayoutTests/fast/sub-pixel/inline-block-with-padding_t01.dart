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
        a {
            padding: .3em 1.6em;
        }
    </style>
''';

const String htmlEL2 = r'''
    <p>
        Both links should render the same and not wrap.
    </p>
    <div>
        <a style="display: inline-block;" href="#">This shouldn't wrap</a>
    </div>
    <div>
        <a href="#">This shouldn't wrap</a>
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var links = document.getElementsByTagName('a');
    var expectedWidth = links[1].offsetWidth;
    Expect.approxEquals(links[0].offsetWidth, links[1].offsetWidth, 5);
}