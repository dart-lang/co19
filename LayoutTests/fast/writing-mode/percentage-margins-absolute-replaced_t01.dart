/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Percentage margins on absolutely positioned replaced elements
 * are relative to the container\'s logical width.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
.outer {
    position: relative;
    width: 100px;
    height: 200px;
}
.inner {
    position: absolute;
    width: 40px;
    height: 160px;
    margin: 5% 10% 15% 20%;
}
.horizontal-tb {
    -webkit-writing-mode: horizontal-tb;
}
.horizontal-tb > .inner {
    margin: 10% 20% 30% 40%;
}
.vertical-lr {
    -webkit-writing-mode: vertical-lr;
}
.vertical-rl {
    -webkit-writing-mode: vertical-rl;
}
</style>
''';

const String htmlEL2 = r'''
<div class='outer horizontal-tb'>
    <svg class='inner horizontal-tb'></svg>
</div>

<div class='outer horizontal-tb'>
    <svg class='inner vertical-lr'></svg>
</div>

<div class='outer horizontal-tb'>
    <svg class='inner vertical-rl'></svg>
</div>

<div class='outer vertical-lr'>
    <svg class='inner horizontal-tb'></svg>
</div>

<div class='outer vertical-lr'>
    <svg class='inner vertcial-lr'></svg>
</div>

<div class='outer vertical-lr'>
    <svg class='inner vertical-rl'></svg>
</div>

<div class='outer vertical-rl'>
    <svg class='inner horizontal-tb'></svg>
</div>

<div class='outer vertical-rl'>
    <svg class='inner vertical-lr'></svg>
</div>

<div class='outer vertical-rl'>
    <svg class='inner vertical-rl'></svg>
</div>
''';

void doTest(e) {
    var inners = document.querySelectorAll('.inner');
    for (var i = 0; i < inners.length; i++) {
        var inner = inners[i];
        var style = inner.getComputedStyle();
        Expect.equals('10px 20px 30px 40px', style.getPropertyValue('margin'));
    }
    print("test passed");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(doTest);
}
