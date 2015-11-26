/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description layout zoom test
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style> 
    #test {
        width: 500px;
        height: 1500px;
        background: skyblue;
    }
    #test > div {
        background: navy;
        height: 15px;
    }
</style>
''';

const String htmlEL2 = r'''
<div id="test"></div>
<div id="console">
    The box above should be navy blue with no banding effects.<br>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var testElement = document.getElementById('test');
    var consoleElement = document.getElementById('console');

    void init() {
        testElement.innerHtml = '';
        for (var i = 0; i < 100; i++)
            testElement.append(document.createElement('div'));
    }

    void test(zoom) {
        testElement.style.zoom = '$zoom%';

        var lastElementBottom = testElement.lastChild.getBoundingClientRect().bottom;
        var containerBottom = testElement.getBoundingClientRect().bottom;

        var tolerance = (1 / (zoom / 100)).ceil();
        shouldBeTrue((lastElementBottom - containerBottom).abs() <= tolerance,
            'zoom = $zoom%, bottom edge of last child at $lastElementBottom, container at $containerBottom.');
    }

    init();
    test(100);
    test(110);
    test(125);
    test(133);
    test(150);
    test(166);
    test(175);
    test(200);
    test(250);
    test(300);
    test(400);
    test(500);
    test(750);
    test(1000);
    test(90);
    test(80);
    test(75);
    test(66);
    test(50);
    test(33);
    test(25);
    test(10);
    test(5);

    checkTestFailures();
}
