/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a document created by createDocument has a
 * document element, and that the document element has the correct name and
 * namespace URI.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var xhtmlURI = 'http://www.w3.org/1999/xhtml';
  var doc = document.implementation.createDocument(xhtmlURI, 'html', null);

  shouldBeNonNull(doc.documentElement);
  shouldBe(doc.documentElement.nodeName, 'html');
  shouldBe(doc.documentElement.namespaceUri, xhtmlURI);
}
