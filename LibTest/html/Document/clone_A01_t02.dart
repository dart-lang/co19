/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node clone(bool deep)
 * Returns a copy of this node.
 * If deep is true, then all of this node's children and decendents are copied
 * as well.
 * If deep is false, then only this node is copied.
 * @description Checks that document is deeply cloned if deep==false.
 * @needsreview issue #16409
 */
import "dart:html";
import "../../../Utils/expect.dart";

// checks than nodes are equal but not identical
void check(Node n1, Node n2) {
  Expect.isNotNull(n1);
  Expect.isNotNull(n2);
  Expect.isFalse(identical(n1, n2));
  Expect.equals(n1, n2);
  var ch1 = n1.childNodes;
  var ch2 = n2.childNodes;
  Expect.listEquals(ch1, ch2);
  for (int k = 0; k < ch1.length; k++) {
    check(ch1[k], ch2[k]);
  }
}

main() {
  Document cd = document.clone(true);
  Expect.isNotNull(cd, "document.clone(true)==null");
  check(document, cd);
}
