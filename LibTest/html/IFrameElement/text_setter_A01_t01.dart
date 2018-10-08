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
  IFrameElement x = new Element.html('<iframe></iframe>');
  var h = new Element.html('<span><div></div>append_1</span>');
  x.append(h);
  x.append(new Element.html('<span><div></div>append_2</span>'));

  Expect.equals(h, x.firstChild);
  Expect.equals(2, x.nodes.length);

  var text = 'single text node';
  x.text = text;
  Expect.equals(1, x.nodes.length);
  Expect.isTrue(x.firstChild is Text);
  Expect.equals(text, x.firstChild.text);
}
