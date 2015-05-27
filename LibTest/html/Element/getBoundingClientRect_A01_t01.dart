/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Rectangle getBoundingClientRect()
 * Returns the smallest bounding rectangle that encompasses this element's
 * padding, scrollbar, and border.
 * @description Checks that hidden elements have width and height zero
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div>Text</div>');
  x.hidden = true;
  document.body.append(x);
  var r = x.getBoundingClientRect();

  Expect.equals(0, r.width, 'width');
  Expect.equals(0, r.height, 'height');
}
