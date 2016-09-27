/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String text
 * All text within this node and its decendents.
 * MDN: For other node types, textContent returns the concatenation of the
 * textContent attribute value of every child node, excluding comments and
 * processing instruction nodes. This is an empty string if the node has
 * no children
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new DivElement();
  Expect.equals('', x.text, 'empty string');

  x.innerHtml = '<div>11<span>21</span><!--skip--><span>22</span>12</div>';
  Expect.equals('11212212', x.text, 'nested elements');
}
