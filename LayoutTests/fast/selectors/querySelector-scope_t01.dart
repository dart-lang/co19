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

const String htmlEL2 = r'''
  <ul>
    <li id='scope'><a>abc</a></li>
    <li>def</li>
    <li><a>efg</a></li>
  </ul>
''';

void main() {
    description('This test makes sure that :scope works correctly.');
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var scope = document.getElementById('scope');
    shouldBe(scope.querySelectorAll("ul a").length, 1);
    shouldBe(scope.querySelector("ul a"), scope.firstChild);
    shouldBe(scope.querySelectorAll(":scope ul a").length, 0);
    shouldBe(scope.querySelector(":scope ul a"), null);
    shouldBe(document.querySelectorAll(":scope ul a").length, 2);
    shouldBe(document.querySelectorAll(":root ul a").length, 2);

    shouldBe(document.querySelectorAll(":scope a").length, 2);
    shouldBe(scope.querySelectorAll(":scope a").length, 1);
    shouldBe(scope.querySelectorAll(":scope a")[0], scope.firstChild);
    shouldBe(scope.querySelector(":scope a"), scope.querySelectorAll(":scope a")[0]);

    checkTestFailures();
}
