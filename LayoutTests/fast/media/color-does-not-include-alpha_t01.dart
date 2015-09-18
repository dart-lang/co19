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
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
    div {
        width: 300px;
        height: 300px;
        background-color: red;
    }
    @media (color:5), (color:8) {
        #test {
            background-color: green;
        }
    }
</style>
''';

const String htmlEL2 = r'''
<div id=test>This box should be green.</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: NodeTreeSanitizer.trusted);
    document.body.appendHtml(htmlEL2, treeSanitizer: NodeTreeSanitizer.trusted);
    var backgroundColor = document.getElementById("test").getComputedStyle(null).backgroundColor;
    const expectedBackgroundColor = "rgb(0, 128, 0)";
    Expect.equals(expectedBackgroundColor, backgroundColor);
}
