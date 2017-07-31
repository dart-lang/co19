/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<Node> childNodes
 * A list of this node's children.
 * @description Checks expected children.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var z = x.childNodes;
  Expect.isTrue(z is List);
}

main() {
  List<Node> targets = [
    new Text("Text1"),
    new Comment("Comment"),
    new DocumentFragment(),
    document
  ];
  for (Node x in targets) {
    check(x);
  }
}
