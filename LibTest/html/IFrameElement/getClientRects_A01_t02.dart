/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Rectangle> getClientRects()
 * Returns a list of bounding rectangles for each box associated with this
 * element.
 * @description Checks that all rects in a list are included in
 * getBoundingClientRect.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(new Element.html('<span>foo<br/>bar</span>'));
  document.body.append(x);
  var rects = x.getClientRects();
  var bigRrect = x.getBoundingClientRect();

  for (var i = 0; i < rects.length; ++i) {
    print("rects[$i]=${rects[i]}; bigRrect=$bigRrect");
    Expect.isTrue(
        bigRrect.containsRectangle(rects[i]), '${i+1} of ${rects.length}');
  }
}
