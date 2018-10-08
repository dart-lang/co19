/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Element parent
 * The parent element of this node.
 * Returns null if this node either does not have a parent or its parent is
 * not an element.
 * @description Checks expected parent values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  Expect.equals(null, x.parent);

  var body = document.body;
  body.append(x);
  Expect.equals(body, x.parent);
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
