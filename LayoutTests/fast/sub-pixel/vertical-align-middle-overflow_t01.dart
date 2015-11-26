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
        .block {
            overflow-x: hidden;
            width: 100px;
        }
        .icon {
            display: inline-block;
            background-color: red;
            height: 29px;
            width: 29px;
            vertical-align: middle;
        }
    </style>
''';

const String htmlEL2 = r'''
    <div id="test-block" class="block">
        <span class="icon">&nbsp;</span>
        <span>Cell 2</span>
    </div>

    <p>
        The block above should not have a scrollbar.
    </p>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var element = document.getElementById('test-block');
    Expect.equals(element.offsetHeight, element.scrollHeight);
}
