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
  var x = new Element.html('<iframe></iframe>');
  Expect.isNull(x.nextElementSibling, "null 1");
  document.body.append(x);

  document.body.append(new Text('text-node'));
  Expect.isNull(x.nextElementSibling, "null 2"); // Text is not an Element

  var y = new Element.html('<div><span>text element</span></div>');
  document.body.append(y);
  var y1 = x.nextElementSibling;
  Expect.equals(y, y1);
}
