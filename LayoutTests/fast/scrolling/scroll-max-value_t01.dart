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
            #test {
                width: 300px;
                height: 300px;
                overflow: auto;
                border: 1px solid silver;
            }
            #test > article {
                width: 1000px;
                height: 1000px;
                position: relative;
            }
            #top-left {
                position: absolute;
                top: 0;
                left: 0;
            }
            #bottom-right {
                position: absolute;
                bottom: 0;
                right: 0;
            }
        </style>
''';

const String htmlEL2 = r'''
        <section id="test">
            <article>
                <span id="top-left">top left</span>
                <span id="bottom-right">bottom right</span>
            </article>
        </section>
        <p>
            Tests that large scrollLeft/Top values aren't being ignored.
        </p>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var el = document.getElementById('test');
    el.scrollLeft = 100000000;
    el.scrollTop = 100000000;

    Element firstElementChild = el.childNodes.firstWhere((x) => x is Element);

    var expectedScrollLeft = firstElementChild.offsetWidth -
        el.clientWidth;
    if (el.scrollLeft == expectedScrollLeft) {
        testPassed('Setting el.scrollLeft = 100000000 scrolls all ' +
            'the way to the right.');
    } else {
        testFailed('Setting el.scrollLeft = 100000000 scrolls to ' +
            el.scrollLeft.toString() + ', expected ' +
            expectedScrollLeft.toString() + '.');
    }

    var expectedScrollTop = firstElementChild.offsetHeight -
        el.clientHeight;
    if (el.scrollTop == expectedScrollTop) {
        testPassed('Setting el.scrollTop = 100000000 scrolls all ' +
            'the way to the bottom.');
    } else {
        testFailed('Setting el.scrollTop = 100000000 scrolls to ' +
            el.scrollTop.toString() + ', expected ' +
            expectedScrollTop.toString() + '.');
    }

    checkTestFailures();
}
