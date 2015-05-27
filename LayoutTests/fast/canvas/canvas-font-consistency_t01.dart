/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure that context.font is consistent.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement('canvas');
  var ctx = canvas.getContext('2d');
  var fontNames = ["bold 13px Arial",
      "italic 13px Arial",
      "small-caps 13px Arial"];

  for (var i = 0; i < fontNames.length; i++) {
    var fontName = fontNames[i];
    debug('Testing font "' + fontName + '"');
    ctx.font = fontName;
    shouldBe(ctx.font, fontName);
  }
}
