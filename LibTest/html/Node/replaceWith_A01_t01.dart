/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node replaceWith(Node otherNode)
 * Replaces this node with another node.
 * @description Checks expected dom after replace
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var body = document.body;

  body.append(x);
  Expect.equals(x, body.lastChild, "lastChild after append");

  var newElem = new AnchorElement();
  x.replaceWith(newElem);
  Expect.equals(newElem, body.lastChild, "lastChild after remove");
}

main() {
  List<Node> targets = [
    new Text("Text1"),
    new Comment("Comment"),
//    new DocumentFragment(),
  ];
  for (Node x in targets) {
    check(x);
  }
}
