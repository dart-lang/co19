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
            section {
                display: inline-block;
                width: 300px;
                border: 1px solid blue;
                margin: 5px 0;
                padding: 5px;
            }
            section > h1 {
                font-size: 1.1em;
                margin: 0;
            }
            
            li {
                list-style-position: inside;
                margin: 5px;
                background: silver;
            }
            ul, ol {
                margin: 0;
                padding: 0;
            }
            
            .floating > ul > li, .floating > ol > li {
                float: left;
            }
            .floating > p {
                clear: both;
            }
            
            .block > ul, .block > ol {
                display: inline-block;
                margin: 0;
                padding: 0;
            }
        </style>
''';

const String htmlEL2 = r'''
        <header>
            <h1>list-style-position: inside</h1>
            <p>
                Tests that lists with header the list marker displayed
                inside the item works as expected.
            </p>
        </header>
        
        <section class="floating">
            <h1>Floating, Unordered</h1>
            <ul>
                <li>Item A</li>
                <li>Item B</li>
                <li>Item C</li>
            </ul>
            <p>
                The list markers above should be inside the respective
                list item boxes.
            </p>
        </section>
        <section class="floating">
            <h1>Floating, Ordered</h1>
            <ol>
                <li>Item A</li>
                <li>Item B</li>
                <li>Item C</li>
            </ol>
            <p>
                The list markers above should be inside the respective
                list item boxes.
            </p>
        </section>
        <br>

        <section class="block">
            <h1>Block, Unordered</h1>
            <ul>
                <li>Item A</li>
                <li>Item B</li>
                <li>Item C</li>
            </ul>
            <p>
                The list markers above should be inside the respective
                list item boxes and the text should not wrap.
            </p>
        </section>
        
        <section class="block">
            <h1>Block, Ordered</h1>
            <ol>
                <li>Item A</li>
                <li>Item B</li>
                <li>Item C</li>
            </ol>
            <p>
                The list markers above should be inside the respective
                list item boxes and the text should not wrap.
            </p>
        </section>
        <br>
        
        <section class="reference">
            <h1>Reference, Unordered</h1>
            <ul>
                <li>Item A</li>
            </ul>
        </section>

        <section class="reference">
            <h1>Reference, Ordered</h1>
            <ol>
                <li>Item A</li>
            </ol>
        </section>
''';

List getItems(className, tagName) {
    var selector = '.$className>$tagName';
    var block = document.querySelector(selector);
    return block.querySelectorAll('li');
}

void doTest(String className, String tagName) {
    var referenceHeight = getItems('reference', tagName)[0].
        getBoundingClientRect().height;
    var testItems = getItems(className, tagName);

    // Check that all items have the right height
    for (int i = 0; i<testItems.length; i++) {
        var item = testItems[i];
        var rect = item.getBoundingClientRect();
        shouldBe(rect.height, referenceHeight,
            'Item $i in $className $tagName has height of ${rect.height}px, expecting ${referenceHeight}px.');
    }

    // Change list-style-type to none and back to ensure
    // that the width changes.
    for (int i = 0; i<testItems.length; i++) {
        var item = testItems[i];
        item.style.listStyleType = 'none';
    }
    var width = testItems[0].getBoundingClientRect().width;
    for (var item, i = 0; item = testItems[i]; i++) {
        item.style.listStyleType = '';
    }
    shouldBe(testItems[0].getBoundingClientRect().width, width,
        'Width of first item in $className $tagName is not affected by list marker as expected.');
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    doTest('floating', 'ul');
    doTest('floating', 'ol');
    doTest('block', 'ul');
    doTest('block', 'ol');
    checkTestFailures();
}