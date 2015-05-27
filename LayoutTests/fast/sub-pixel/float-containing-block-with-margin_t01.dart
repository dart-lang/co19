/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Links to the right should not wrap.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
        <style>
            ul > li { float: right; background: skyblue; }
            ul > li > a { display: block; margin: 10.5px; text-decoration: none; }
        </style>
''';

const String htmlEL2 = r'''
        <ul>
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">dolor sit amet</a></li>
            <li><a href="#">consectetur adipiscing elit</a></li>
        </ul>
        Links to the right should not wrap.
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var elements = document.getElementsByTagName('li');
    num getItemHeight(i) {
        return elements[i].getBoundingClientRect().top;
    }
    
    shouldBe(getItemHeight(1), getItemHeight(0), 'getItemHeight(1)');
    shouldBe(getItemHeight(2), getItemHeight(0), 'getItemHeight(2)');

    checkTestFailures();
}
