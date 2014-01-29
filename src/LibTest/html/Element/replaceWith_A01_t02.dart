/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node replaceWith(Node otherNode)
 * Replaces this node with another node.
 * @needsreview What should happen if child is replaced with one of ancestors
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var parent = new Element.html('<div><h1></h1></div>');
  var child = parent.querySelector('h1');

  Expect.throws(() {
    child.replaceWith(parent);
  });
}
