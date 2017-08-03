/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<Node> childNodes
 * A list of this node's children.
 * @description Checks that childNodes is not modifiable.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(dynamic x) {
  Expect.throws(() => x.childNodes = []);
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
