/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This page tests the DOM createHtmlDocument method.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  debug("[document with title 'title']");
  var doc = document.implementation.createHtmlDocument("title");
  shouldBe(doc.title, "title");
  shouldBe(doc.getElementsByTagName('html').length, 1);
  shouldBe(doc.getElementsByTagName('head').length, 1);
  shouldBe(doc.getElementsByTagName('title').length, 1);
  shouldBe(doc.getElementsByTagName('body').length, 1);

  debug("[document with title '']");
  doc = document.implementation.createHtmlDocument("");
  shouldBe(doc.title, "");

  debug("[document with null title]");
  doc = document.implementation.createHtmlDocument(null);
  shouldBe(doc.title, "null");
}
