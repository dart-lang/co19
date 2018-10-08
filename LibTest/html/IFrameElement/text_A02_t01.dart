/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String text
 * All text within this node and its decendents.
 * MDN: If the node is a CDATA section, a comment, a processing instruction,
 * or a text node, textContent returns the text inside this node (the nodeValue).
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Comment x = new Comment('comment');
  Expect.equals('comment', x.text);

  Text y = new Text('text');
  Expect.equals('text', y.text);
}
