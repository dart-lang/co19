/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests XmlSerializer.serializeToString() on a DocumentType
 * node that has a document associated with it.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var docType = window.document.implementation.createDocumentType("aDocTypeName", "aPublicID", "aSystemID");
  var doc = window.document.implementation.createDocument("", "", docType);

  var serializer = new XmlSerializer();

  var result = serializer.serializeToString(docType);
  shouldBe(result, '<!DOCTYPE aDocTypeName PUBLIC "aPublicID" "aSystemID">');
}
