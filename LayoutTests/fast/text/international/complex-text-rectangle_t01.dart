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
import "../../../../Utils/expect.dart";
import "../../../testharness.dart";

const String htmlEL1 = r'''
<meta charset=utf-8>
''';

const String htmlEL2 = r'''
<span id="a">A&#x20d5;A&#xFE20;A&#x20d5;A&#x20d5;A&#x20d5;A&#x20d5;A&#x20d5;&#x20d5;A&#x034b;</span>
''';

void runTest(e) {
    var range = document.createRange();
    var divs = document.getElementsByClassName("zh-CN-div");
    var pass = true;
    for (var j = 0; j < divs.length; ++j) {
        var div = divs[j];
        var length = div.text.length;
        var title = div.title.split(' ');
        for (var i = 0; i < length; ++i) {
            range.setStart(div.firstChild, i);
            range.setEnd(div.firstChild, i);
            range.expand('word');
            var actual = range.toString();
            shouldBe(actual, title[i], "$i");
        }
        div.style.display = "none";
    }
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var textNode = document.getElementById('a').firstChild;
    var length = textNode.text.length;
    for (var start = 0; start < length; ++start) {
        for (var end = 0; end < length; ++end) {
            var range = document.createRange();
            range.setStart(textNode, start);
            range.setEnd(textNode, end);
            var rect = range.getBoundingClientRect();
            test((){
              Expect.isFalse(rect.width < 0);
              Expect.isFalse(rect.width > 200);
            },
             'rect.width is ${rect.width}'
            );
        }
    }
    checkTestFailures();
}
