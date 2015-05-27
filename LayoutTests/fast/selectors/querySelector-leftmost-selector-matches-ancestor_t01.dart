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
  <div class="parentSibling"></div>
  <div class="parent">
    <div id="sibling" class="sibling"></div>
    <div id="rootNode" class="rootNode">
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div>
''';

void main() {
    description('Test for crbug.com/304069: querySelectorAll regression.');
    document.body.id='body';
    document.body.classes.add('body');
    document.body.appendHtml(htmlEL2);

    var rootNode = document.getElementById('rootNode');
    
    shouldBe(rootNode.querySelectorAll('#body div').length, 6);
    shouldBe(rootNode.querySelectorAll('#body').length, 0);
    shouldBe(rootNode.querySelectorAll('div + #rootNode div').length, 6);
    
    shouldBe(rootNode.querySelectorAll('.sibling + .rootNode div').length, 6);
    shouldBe(rootNode.querySelectorAll('.sibling ~ .rootNode div').length, 6);
    shouldBe(rootNode.querySelectorAll('.sibling .rootNode div').length, 0);
    shouldBe(rootNode.querySelectorAll('.sibling div').length, 0);
    shouldBe(rootNode.querySelectorAll('.body .rootNode div').length, 6);
    shouldBe(rootNode.querySelectorAll('.body .sibling + .rootNode div').length, 6);
    shouldBe(rootNode.querySelectorAll('.body .parentSibling + .parent div').length, 6);
    shouldBe(rootNode.querySelectorAll('.body .parentSibling ~ .parent div').length, 6);
    shouldBe(rootNode.querySelectorAll('.body div').length, 6);
    shouldBe(rootNode.querySelectorAll('.body').length, 0);
    
    shouldBe(rootNode.querySelectorAll('body div').length, 6);
    shouldBe(rootNode.querySelectorAll('body').length, 0);
    
    shouldBe(rootNode.querySelector('#body'), null);
    shouldBe(rootNode.querySelector('.body'), null);
    shouldBe(rootNode.querySelector('body'), null);

    checkTestFailures();
}
