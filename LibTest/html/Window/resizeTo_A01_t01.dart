/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void resizeTo(num width, num height)
 * Resizes this window to a specific width and height.
 * @description Checks that a window can be resized.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

void check(Window nw, int nx, int ny) {
  nw.resizeBy(nx, ny);
  Expect.equals(nx, nw.innerWidth);
  Expect.equals(ny, nw.innerHeight);
}

main() {
  Window nw = window.open("about:blank", "_blank");
  try {
    check(nw, 0, 0);
    check(nw, 1, 0);
    check(nw, 0, 1);
    check(nw, 1, 1);
    check(nw, -1, 0);
    check(nw, 0, -1);
    check(nw, -1, -1);
    check(nw, 100, 100);
  } finally {
    nw.close();
  }
}
