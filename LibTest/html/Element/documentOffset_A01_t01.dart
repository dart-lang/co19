/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final documentOffset
 * Provides the coordinates of the element relative to the top of the document.
 * @description Checks that if there is no scroll, it should be equal to offset
 * of client rectangle.  
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div>First div</div>');
  document.body.append(x);

  x = new Element.html('<div>Second div</div>');
  x.style.margin = '10px';
  document.body.append(x);

  var r = x.getBoundingClientRect();
  var off = x.documentOffset;

  Expect.approxEquals(r.left, off.x, 1, 'left');
  Expect.approxEquals(r.top, off.y, 1, 'top');
}
