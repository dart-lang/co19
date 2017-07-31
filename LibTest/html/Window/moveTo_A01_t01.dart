/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void moveTo(Point p)
 * Moves this window to a specific position.
 * x and y can be negative.
 * @description Checks that a window can be moved.
 * @issue #16928
 */
import "dart:html";
import "dart:math";
import "../../../UtilsHtml/expect.dart";

void check(Window nw, int nx, int ny) {
  print("from ${nw.screenLeft}:${nw.screenTop} to $nx, $ny");
  nw.moveTo(new Point(nx, ny));
  print("after moveTo: ${nw.screenLeft}:${nw.screenTop}");
  Expect.equals(nx, nw.screenLeft);
  Expect.equals(ny, nw.screenTop);
}

main() {
  Window nw = window.open("about:blank", "_blank");

  try {
    check(nw, 0, 0);
    check(nw, 1, 0);
    check(nw, 0, 1);
    check(nw, 1, 1);
    check(nw, 100, 100);
  } finally {
    nw.close();
  }
}
