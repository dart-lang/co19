/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String text
 * All text within this node and its decendents.
 * MDN: textContent returns null if the element is a document, a document type,
 * or a notation.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  document.body.innerHtml = '<div></div>';

  Expect.isNull(document.text, 'document');

  var x = document.implementation.createDocumentType('html',
      '-//W3C//DTD HTML 4.01//EN', 'http://www.w3.org/TR/html4/strict.dtd');

  Expect.isNull(x.text, 'document type');
}
