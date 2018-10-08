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

var d = document.implementation.createHtmlDocument('doc');

void check(Node x) {
  Expect.equals(document, x.ownerDocument);
  IFrameElement x2 = d.importNode(x);
  Expect.equals(d, x2.ownerDocument);
}

main() {
  List<Node> targets = [
    new Comment("comment"),
    new Text("text"),
    new DocumentFragment(),
  ];
  for (Node x in targets) {
    check(x);
  }
}
