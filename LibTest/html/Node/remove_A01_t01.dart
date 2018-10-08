/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void remove()
 * Removes this node from the DOM
 * @description Checks expected dom after removal
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var body = document.body;
  var lastChild = body.lastChild;

  body.append(x);
  Expect.equals(x, body.lastChild, "lastChild after append");

  x.remove();
  Expect.equals(lastChild, body.lastChild, "lastChild after remove");
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
