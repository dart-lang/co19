/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final borderEdge
 * Access the dimensions and position of this element's content + padding +
 * border box.
 * This returns a rectangle with the dimenions actually available for content
 * in this element, in pixels, regardless of this element's box-sizing
 * property. Unlike getBoundingClientRect, the dimensions of this rectangle
 * will return the same numerical height if the element is hidden or not.
 * @description Checks that if element is hidden it does not affect dimensions
 * of the rectangle.
 * @needsreview issue #17456
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new Element.html('<iframe id="id">some text</iframe>');
  x.hidden = false;
  document.body.append(x);
  int width = x.borderEdge.width;
  int height = x.borderEdge.height;

  x.hidden = true;
  Expect.equals(width, x.borderEdge.width, 'width');
  Expect.equals(height, x.borderEdge.height, 'height');
}
