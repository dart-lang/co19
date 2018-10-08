/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node parentNode
 * The parent node of this node.
 * from DOM-lelvel-3:  if a node has just been created and not yet added to the tree,
 * or if it has been removed from the tree, this is null. 
 * @description Checks expected parentNode values
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  Expect.equals(null, x.parentNode, "before append $x");
  var body = document.body;
  body.append(x);
  Expect.equals(body, x.parentNode, "before remove $x");

  x.remove();
  Expect.equals(null, x.parentNode, "after remove $x");
}

main() {
  List<Node> targets = [
    new Comment("comment"),
    new Text("text"),
//    new DocumentFragment(),
  ];
  for (Node x in targets) {
    check(x);
  }
}
