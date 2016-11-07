/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that links resouce URLs are resolved dynamically
 * when inserted into the document, and honor the base URL of the document 
 * at the time of insertion.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <h1 id=test>I should be blue</h1>
    <h1 id=test2>I should be red</h1>
    ''', treeSanitizer: new NullTreeSanitizer());

  LinkElement base = document.createElement('base');
  base.href = '$root/resources/';

  var link1 = document.createElement('link');
  link1.setAttribute('rel', 'stylesheet');
  link1.setAttribute('href', 'stylesheet.css');

  var foreignDocument = document.implementation.createHtmlDocument('');
  var link2 = foreignDocument.createElement('link');
  link2.setAttribute('rel', 'stylesheet');
  link2.setAttribute('href', 'stylesheet2.css');

  document.body.append(base);
  document.body.append(link1);
  document.body.append(link2);

  debug('test');
  var test = document.getElementById('test');
  var testColor = test.getComputedStyle().color;
  shouldBe(testColor, 'rgb(0, 0, 255)');

  debug('test2');
  var test2 = document.getElementById('test2');
  var test2Color = test2.getComputedStyle().color;
  shouldBe(test2Color, 'rgb(255, 0, 0)');
}
