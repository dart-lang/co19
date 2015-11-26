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
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <pre id='console'></pre>
''';
//<body id="body" class="body">

void main() {
    description('Test for crbug.com/304069: querySelectorAll regression.');
    document.body.id='target';
    document.body.classes.add('target');
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    shouldBe(document.body.querySelectorAll('#target > div').length, 6);
    shouldBe(document.body.querySelectorAll('#target').length, 0);
    shouldBe(document.body.querySelectorAll('.target > div').length, 6);
    shouldBe(document.body.querySelectorAll('.target').length, 0);
    shouldBe(document.body.querySelectorAll('body > div').length, 6);
    shouldBe(document.body.querySelectorAll('body').length, 0);
    shouldBe(document.body.querySelector('#target'), null);
    shouldBe(document.body.querySelector('.target'), null);
    shouldBe(document.body.querySelector('body'), null);

    checkTestFailures();
}
