/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that the querySelector and querySelectorAll fast 
 * path for IDs is not overzelous.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  HtmlDocument doc = new DomParser().parseFromString('''
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
    ''', 'text/html');

  DivElement root = doc.createElement('div');
  var correctNode = doc.createElement('div');
  correctNode.setAttribute("id", "testId");
  root.append(correctNode);
  doc.body.append(root);

  shouldBe(doc.querySelector('#testId'), correctNode);
  shouldBe(doc.querySelector('div#testId'), correctNode);
  shouldBeNull(doc.querySelector('ul#testId'));
  shouldBeNull(doc.querySelector('ul #testId'));
  shouldBeNull(doc.querySelector('#testId[attr]'));
  shouldBeNull(doc.querySelector('#testId:not(div)'));

  shouldBe(doc.querySelectorAll('div#testId').length, 1);
  shouldBe(doc.querySelectorAll('div#testId')[0], correctNode);
  shouldBe(doc.querySelectorAll('#testId').length, 1);
  shouldBe(doc.querySelectorAll('#testId')[0], correctNode);
  shouldBe(doc.querySelectorAll('ul#testId').length, 0);
  shouldBe(doc.querySelectorAll('ul #testId').length, 0);
  shouldBe(doc.querySelectorAll('#testId[attr]').length, 0);
  shouldBe(doc.querySelectorAll('#testId:not(div)').length, 0);
}
