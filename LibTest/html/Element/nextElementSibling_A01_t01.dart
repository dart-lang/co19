/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Element nextElementSibling
 * The element immediately following the given one in the tree, or null if
 * there's no sibling node.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Element x = new Element.html('<span></span>');
  Expect.isNull(x.nextElementSibling);

  x = new Element.html(
      '<div><span>span1</span>text-node<span>span2</span></div>');
  Element y = x.firstChild; // span1

  y = y.nextElementSibling; // span2, text node should be skipped
  Expect.isTrue(y is SpanElement);

  y = y.nextElementSibling;
  Expect.isNull(y);
}
