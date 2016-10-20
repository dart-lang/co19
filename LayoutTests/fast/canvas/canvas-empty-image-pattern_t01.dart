/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Canvas test: filling a pattern with an empty image should not
 * crash and should return a null pattern.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" class="output" width="100" height="100"><p class="fallback">FAIL (fallback content)</p></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = getContext2d("canvas");
  var pattern = canvas.createPatternFromImage(new ImageElement(), "repeat");
  shouldBeNull(pattern);
}
