/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node nextNode
 * The next sibling node.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<span></span>');
  Expect.isNull(x.nextNode);

  x = new Element.html(
      '<div><span>span1</span>text node<span>span2</span></div>');
  var y = x.firstChild; // span1
  Expect.equals('span1', y.text);

  y = y.nextNode; // text node should not be skipped
  Expect.equals('text node', y.text);

  y = y.nextNode; // span2
  Expect.equals('span2', y.text);

  y = y.nextNode;
  Expect.isNull(y);
}
