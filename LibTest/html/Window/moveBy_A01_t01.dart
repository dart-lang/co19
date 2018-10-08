/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void moveBy(num x, num y)
 * Moves this window.
 * x and y can be negative.
 * @description Checks that a window can be moved.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

void check(Window nw, int dx, int dy) {
  int x = nw.screenLeft;
  int y = nw.screenTop;
  nw.moveBy(dx, dy);
  Expect.equals(x + dx, nw.screenLeft);
  Expect.equals(y + dy, nw.screenTop);
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
