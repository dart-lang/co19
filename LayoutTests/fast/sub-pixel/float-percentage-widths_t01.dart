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
<style>
    .container { width: 249px; margin: 0 auto; }
    .child { width: 30%; margin-right: 5%; margin-bottom: 10px; background: black; float: left; color: white; }
    .child.last { margin-right: 0; }
</style>
''';

const String htmlEL2 = r'''
<p>The three boxes below should all appear on the same line.</p>
<div class="container">
    <div class="child">&nbsp;</div>
    <div class="child">&nbsp;</div>
    <div class="child last">&nbsp;</div>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var children = document.getElementsByClassName('child');
    var firstChildTop = children[0].getBoundingClientRect().top;
    var lastChildTop = children[2].getBoundingClientRect().top;
    if (firstChildTop == lastChildTop)
        testPassed('All boxes are on the same line.');
    else
        shouldBe(children[0].getBoundingClientRect().top, children[2].getBoundingClientRect().top);

    checkTestFailures();
}
