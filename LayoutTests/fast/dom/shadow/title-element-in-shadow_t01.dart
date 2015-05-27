/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test ensures that title elements in a shadow subtree do
 * not affect document.title attribute.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var doc = document.implementation.createHtmlDocument('');
  doc.querySelector('title').remove();
  debug('create a title element and insert it to document.');
  var title = doc.createElement('title');
  title.append(new Text('document title'));
  doc.head.append(title);
  shouldBe(doc.title, "document title");
  title.remove();
  debug('remove title element from document.');
  shouldBe(doc.title, "");

  debug('create a shadow root whose host is already in document, create a subtree which contains a title element, and add the subtree to the shadow root.');
  var subtree1 = doc.createElement('div');
  var shadow1 = subtree1.createShadowRoot();
  doc.head.append(subtree1);
  var shadowTitle = doc.createElement('title');
  shadowTitle.append(new Text('shadow title1'));
  shadow1.append(shadowTitle);
  shouldBe(doc.title, "");

  debug('remove the subtree from document.');
  subtree1.remove();
  shouldBe(doc.title, "");

  debug('create a subtree, add a shadow root which contains a title element to the subtree, and insert the subtree to document.');
  var subtree2 = doc.createElement('div');
  var shadow2 = subtree2.createShadowRoot();
  shadow2.innerHtml = '<title>shadow title2</title>';
  doc.head.append(subtree2);
  shouldBe(doc.title, "");
  debug('remove the subtree from document');
  subtree2.remove();
  shouldBe(doc.title, "");
}