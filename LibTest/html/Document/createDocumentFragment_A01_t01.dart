/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DocumentFragment createDocumentFragment()
 * Creates a new document fragment.
 * @description Checks that newly created document fragment is empty.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  DocumentFragment df = document.createDocumentFragment();
  Expect.equals(0, df.childNodes.length);
}
