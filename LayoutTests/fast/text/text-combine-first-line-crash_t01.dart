/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test passes if it does not CRASH.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
#test {
    -webkit-text-combine: horizontal;
    -webkit-writing-mode: vertical-rl;
    height: 0px;
}
#test::first-line {
    color: black;
}
</style>
''';

const String htmlEL2 = r'''
This test passes if it does not CRASH.
<span id="test">
</span>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    
    var testElem = document.getElementById("test");
    testElem.text = '';
}
