/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Element parent
 * The parent element of this node.
 * Returns null if this node either does not have a parent or its parent is
 * not an element.
 * @description Checks that parent is changed after append
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<span></span>');
  Expect.isNull(x.parent);

  document.body.append(x);
  Expect.isTrue(x.parent is BodyElement);
}
