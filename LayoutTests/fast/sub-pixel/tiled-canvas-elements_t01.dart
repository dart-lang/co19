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
        #console { margin-top: 40px; }
    </style>
''';

const String htmlEL2 = r'''
    <div>
        <canvas style="position: absolute; top: 0px; left: 0px; background-color: black;" width="32" height="32"></canvas>
        <canvas style="position: absolute; top: 0px; left: 32px; background-color: black;" width="32" height="32"></canvas>
        <canvas style="position: absolute; top: 0px; left: 64px; background-color: black;" width="32" height="32"></canvas>
        <canvas style="position: absolute; top: 0px; left: 96px; background-color: black;" width="32" height="32"></canvas>
    </div>
''';

double r(n) {
    return (n * 1000).round() / 1000;
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
        
    var expected = 0;
    var elements = document.getElementsByTagName('canvas');
    print("elements=$elements");
    for (var i = 0; i<elements.length; i++) {
        var rect = elements[i].getBoundingClientRect();
        shouldBe(rect.left.round(), expected.round(), "i=$i");
        expected += rect.width;
    }
    checkTestFailures();
}
