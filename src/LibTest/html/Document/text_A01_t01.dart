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
 * @description Checks the content of this property.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isNull(document.text);
}
