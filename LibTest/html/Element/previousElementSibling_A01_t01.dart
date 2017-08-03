/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Element previousElementSibling
 * The element immediately preceding the given one in the tree, or null if
 * there is no sibling element.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<span></span>');
  Expect.isNull(x.previousElementSibling);

  x = new Element.html(
      '<div><span id="span1"></span>text-node<span id="span2"></span></div>');
  var y = x.querySelector('#span2');

  y = y.previousElementSibling; // span1, text node should be skipped
  Expect.isTrue(y is SpanElement);

  y = y.previousElementSibling;
  Expect.isNull(y);
}
