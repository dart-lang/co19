/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node previousNode
 * The previous sibling node.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  Expect.isNull(x.previousNode);

  var body = document.body;
  var child = body.lastChild;
  body.append(x);
  Expect.equals(child, x.previousNode);
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
