/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests CanvasPathMethods ellipse with negative radii.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement("canvas");
  var ctx = canvas.getContext('2d');

  shouldNotThrow(() => ctx.ellipse(10, 10, 10, 5, 0, 0, 1, false));
  shouldNotThrow(() => ctx.ellipse(10, 10, 10, 0, 0, 0, 1, false));
  shouldNotThrow(() => ctx.ellipse(10, 10, -0, 5, 0, 0, 1, false));

  shouldThrow(() => ctx.ellipse(10, 10, -2, 5, 0, 0, 1, false));
  shouldThrow(() => ctx.ellipse(10, 10, 0, -1.5, 0, 0, 1, false));
  shouldThrow(() => ctx.ellipse(10, 10, -2, -5, 0, 0, 1, false));

  // FIXME: When this is exposed on Path as well as CanvasRenderingContext2D, add tests for Path as well.
}
