/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node previousNode
 * The previous sibling node.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<span></span>');
  Expect.isNull(x.previousNode);

  x = new Element.html(
      '<div><span id="span1"></span>text node<span id="span2"></span></div>');
  var y = x.querySelector('#span2');

  y = y.previousNode; // text node should not be skipped
  Expect.equals('text node', y.text);

  y = y.previousNode; // span1
  Expect.equals('span1', y.id);

  y = y.previousNode;
  Expect.isNull(y);
}
