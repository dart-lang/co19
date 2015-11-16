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

const String htmlEL1 = r'''
<style type="text/css">
#container {
    width: 200px;
    height: 100px;
    overflow: auto; 
}
#innerBox {
    width: 200%;
    height: 100%;
}
</style>
''';

const String htmlEL2 = r'''
<div id="container">
    <div id="innerBox" style="background:green"></div>
</div>
<div id="description"></div>
<div id="console"></div>
''';

void main() {
    description(
'''Testcase for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=11355">https://bugs.webkit.org/show_bug.cgi?id=11355</a>.
When a container having overflow:auto has a horizontal scrollbar,
the scrollbar is to be placed between the inner border edge and the outer padding edge.
Thus the content height of a child inside the container must not include the height of the horizontal scollbars.
''');
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    
    debug('''The height of the inner element box should be 100% of the containers height minus the height of horizontal scrollbar.
There should be no vertical scrollable content in the container<br>
''');
    shouldBe(document.getElementById("container").scrollHeight, document.getElementById("container").clientHeight);
    debug('Container height = Inner Box height + scrollbar height');
    shouldBeTrue(document.getElementById("container").offsetHeight > document.getElementById("innerBox").offsetHeight);

    checkTestFailures();
}
