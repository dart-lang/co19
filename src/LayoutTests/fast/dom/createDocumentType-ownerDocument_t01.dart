/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that DOMImplementation.createDocumentType() properly
 * sets the node's document to the associated document of the context object.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var docType = document.implementation.createDocumentType("html", '', '');
  shouldBe(docType.ownerDocument, document);
  var newDocument;
  shouldNotThrow(() {
    newDocument = document.implementation.createDocument('', '', docType);
  });
  //shouldBe(newDocument.doctype, docType);
  //shouldBe(newDocument.doctype.ownerDocument, newDocument);
}
