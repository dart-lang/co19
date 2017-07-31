/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Node other)
 * Returns true if this node contains the specified node.
 * @description Checks the method's returned value.
 */
import "dart:html";
import "../../../Utils/expect.dart";

// checks that the node n1 and its children are contained in document
void check(Node n1, bool expected) {
  Expect.equals(expected, document.contains(n1));
  var ch1 = n1.childNodes;
  if (ch1 == null) {
    return;
  }
  for (Node chn in ch1) {
    check(chn, expected);
  }
}

main() {
  check(document, true);
  var x = new Element.html('<span><button><div></div></button></span>');
  check(x, false);

  document.body.append(x);
  check(x, true);
}
