/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void void resizeBy(num x, num y)
 * Resizes this window by an offset.
 * @description Checks that a window can be resized.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

void check(WindowBase nw, int dx, int dy) {
  int x=nw.screenLeft;
  int y=nw.screenTop;
  nw.resizeBy(nx, ny);
  Expect.equals(x+dx, nw.innerWidth);
  Expect.equals(y+dy, nw.innerHeight);
}

main() {
  WindowBase nw=window.open("about:blank", "_blank");
  try {
    check(nw,0,0);
    check(nw,1,0);
    check(nw,0,1);
    check(nw,1,1);
    check(nw,-1,0);
    check(nw,0,-1);
    check(nw,-1,-1);
    check(nw,100,100);
  } finally {
    nw.close();
  }
}
