/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final paddingEdge
 * Access the dimensions and position of this element's content + padding box.
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
  IFrameElement x = new Element.html('<iframe class="y">Content Text</iframe>');
  document.body.append(x);
  var edge = x.paddingEdge;
  var height = edge.height;
  var width = edge.width;

  Expect.isTrue(height > 0, 'height 1');
  Expect.isTrue(width > 0, 'width 1');

  x.hidden = true;
  Expect.equals(height, edge.height, 'height 2');
  Expect.equals(width, edge.width, 'width 2');
}
