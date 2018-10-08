/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final contentEdge
 * Access this element's content position.
 * This returns a rectangle with the dimenions actually available for content
 * in this element, in pixels, regardless of this element's box-sizing
 * property. Unlike getBoundingClientRect, the dimensions of this rectangle
 * will return the same numerical height if the element is hidden or not.
 * @description Checks that if element is hidden it does not affect dimensions
 * of the rectangle.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x1 = new IFrameElement();
  x1.append(new Element.html('<div><a>A</a>Text</div>'));
  x1.hidden = true;
  document.body.append(x1);
  IFrameElement x2 = new IFrameElement();
  x2.append(new Element.html('<div><a>A</a>Text</div>'));
  x2.hidden = true;
  document.body.append(x2);

  Expect.equals(x1.contentEdge.width, x2.contentEdge.height);
}
