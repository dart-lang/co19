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
.block
{
    width:100px;
    height:200px;
    padding:50%;
    background-color:green;
}
</style>
''';

const String htmlEL2 = r'''
<div style="width:100px;height:200px; -webkit-writing-mode:vertical-lr">
<div id="test" class="block"></div>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var test = document.getElementById("test");
    var rect = test.getBoundingClientRect();
    var width = rect.right - rect.left;
    var height = rect.bottom - rect.top;
    Expect.equals(300, width);
    Expect.equals(400, height);
    print("test passed");
}
