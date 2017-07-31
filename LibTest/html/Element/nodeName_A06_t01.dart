/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String nodeName
 * The name of this node.
 * This varies by this node's nodeType:
 * DocumentType -- same as DocumentType.name
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = document.implementation.createDocumentType('html',
      '-//W3C//DTD HTML 4.01//EN', 'http://www.w3.org/TR/html4/strict.dtd');
  Expect.equals('html', x.nodeName);
}
