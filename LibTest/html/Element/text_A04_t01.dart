/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String text
 * All text within this node and its decendents.
 * MDN: Setting this property on a node removes all of its children and
 * replaces them with a single text node with the given value.
 * @description Checks that setting the text removes all the children and
 * sets single text node.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new DivElement();

  x.innerHtml = '<div>11<span>21</span><!--skip--><span>22</span>12</div>';

  x.text = 'single text node';

  Expect.equals(1, x.nodes.length);

  Expect.isTrue(x.firstChild is Text);
}
