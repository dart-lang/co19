/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Document get document
 * The newest document in this window.
 * @description Checks that the newest document in this window returned.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  Window nw = window.open("about:blank", "_blank");
  Document doc = nw.document;
  Expect.equals(nw, doc.window);
  nw.close();
}
