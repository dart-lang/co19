/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasChildNodes()
 * Returns true if this node has any children.
 * @description Checks expected values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  Expect.isFalse(x.hasChildNodes(), 'no children');

  var z = new Element.html('<span><div></div><button></button></span>');
  var y = z.querySelector('div');

  x.append(y);
  Expect.isTrue(x.hasChildNodes(), 'one child');
}

main() {
  List<Node> targets = [
    new IFrameElement(),
    new DocumentFragment(),
  ];
  for (Node x in targets) {
    check(x);
  }
}
