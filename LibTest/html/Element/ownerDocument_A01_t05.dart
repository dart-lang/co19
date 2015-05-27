/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Document ownerDocument
 * The document this node belongs to.
 * @description Checks ownerDocument of imported node
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var n = document.createElement('text');
  var d = document.implementation.createHtmlDocument('doc');
  var n2 = d.importNode(n);
  Expect.equals(d, n2.ownerDocument);
}
