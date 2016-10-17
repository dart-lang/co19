/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final marginEdge
 * Access the dimensions and position of this element's content + padding +
 * border + margin box.
 * This returns a rectangle with the dimenions actually available for content
 * in this element, in pixels, regardless of this element's box-sizing
 * property. Unlike getBoundingClientRect, the dimensions of this rectangle
 * will return the same numerical height if the element is hidden or not.
 * @description Checks that if element is hidden it does not affect dimensions
 * of the rectangle.
 * @issue #17456
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<iframe>Text</iframe>');
  document.body.append(x);

  var width = x.marginEdge.width;
  var height = x.marginEdge.height;
  Expect.isTrue(width > 0, 'width 1');
  Expect.isTrue(height > 0, 'height 1');

  x.hidden = true;
  Expect.equals(width, x.marginEdge.width, 'width 2');
  Expect.equals(height, x.marginEdge.height, 'height 2');
}
