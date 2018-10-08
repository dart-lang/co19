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
        body {

        }
        nav {
            position: absolute;
            top: 100px;
            width: 400px;
            height: 40px;
            border: 1px solid blue;
        }
        nav > ul {
            float: right;
            list-style: inside;
        }
        nav > ul > li {
            float: left;
        }
        nav > ul > li > a {
            text-decoration: none;
        }
    </style>
''';

const String htmlEL2 = r'''
    <nav>
        <ul>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </nav>
''';

Element firstElementChild(Node parent)  => parent.childNodes.firstWhere((x) => x is Element);
Element lastElementChild(Node parent)  => parent.childNodes.lastWhere((x) => x is Element);

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    UListElement list = document.getElementsByTagName('ul')[0] as UListElement;
    var firstLinkTop = firstElementChild(list).getBoundingClientRect().top;
    var lastLinkTop = lastElementChild(list).getBoundingClientRect().top;

    shouldBe(firstLinkTop, lastLinkTop, 'Links should be on the same line.');

    asyncStart();
    window.onLoad.listen((e) {
        list.style.marginRight = '-10px';
        list.offsetTop;
        list.style.marginRight = 'auto';

        shouldBe(firstElementChild(list).getBoundingClientRect().top, firstLinkTop, "First link moved after layout.");
        shouldBe(lastElementChild(list).getBoundingClientRect().top, lastLinkTop, "Last link moved after layout.");

        checkTestFailures();
        asyncEnd();
    });
}