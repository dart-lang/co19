/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for bug 66291: Crash because
 * CSSPrimitiveValue::computeLengthDouble assumes fontMetrics are available.
 * This test passed as it did not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas"></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());
  var canvas = document.getElementById("canvas");
  var oContext2d = canvas.getContext("2d");

  oContext2d.font = "small-caps .0ex G";
  oContext2d.font = "italic .0ex G";
  oContext2d.font = "italic 400 .0ex G";
  oContext2d.font = "italic 400 small/.0ex G";
}
