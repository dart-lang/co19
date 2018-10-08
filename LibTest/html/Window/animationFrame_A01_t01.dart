/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<num> get animationFrame
 * Returns a Future that completes just before the window is about to repaint
 * so the user can draw an animation frame.
 * The Future completes to a timestamp that represents a floating point value
 * of the number of milliseconds that have elapsed since the page started to load
 * (which is also the timestamp at this call to animationFrame).
 * @description Checks that the Future completes with a floating point value
 */
import "dart:html";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Window nw = document.window;
  Future<num> animationFrame = nw.animationFrame;
  asyncStart();
  animationFrame.then((num) {
    Expect.isTrue(num is double);
    print("num=$num");
    asyncEnd();
    nw.close();
  });
}
