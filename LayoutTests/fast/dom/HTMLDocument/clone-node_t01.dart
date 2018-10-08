/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests cloneNode for HTMLDocument.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  shouldBeTrue(document.clone(false) is HtmlDocument);
  shouldBe((document.clone(true)as HtmlDocument).title, document.title);
  var doc = document.implementation.createHtmlDocument('title');
  shouldBeTrue(doc.clone(false) is HtmlDocument);
  shouldBe((doc.clone(true) as HtmlDocument).title, doc.title);
}
