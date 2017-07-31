/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Element createElement(String tagName, [String typeExtension])
 * Creates a new element with the given tag name.
 * @description Checks that newly created element belongs to this document.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  Element el = document.createElement("div");
  Expect.equals(document, el.ownerDocument);
  Expect.isTrue(el is DivElement);

  el = document.createElement("table");
  Expect.equals(document, el.ownerDocument);
  Expect.isTrue(el is TableElement);

  el = document.createElement("unknownTag");
  Expect.equals(document, el.ownerDocument);
  Expect.isTrue(el is UnknownElement);
}
