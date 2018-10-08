/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Rectangle> getClientRects()
 * Returns a list of bounding rectangles for each box associated with this
 * element.
 * @description Checks that the empty list is returned if element does not
 * have associated layout box.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(new Element.html('<span>Text</span>'));
  x.style.display = 'none';
  document.body.append(x);

  Expect.listEquals([], x.getClientRects());
}
