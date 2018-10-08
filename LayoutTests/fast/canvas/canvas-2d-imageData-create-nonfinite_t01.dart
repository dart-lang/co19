/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the argument bounds of canvas createImageData.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width=600 height=300>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById('canvas');
  var ctx = canvas.getContext('2d');

  var Infinity = double.infinity;
  var NegInfinity = double.negativeInfinity;
  var NaN = double.nan;

  shouldThrow(() => ctx.createImageData(Infinity, Infinity));
  shouldThrow(() => ctx.createImageData(Infinity, 10));
  shouldThrow(() => ctx.createImageData(NegInfinity, 10));
  shouldThrow(() => ctx.createImageData(10, Infinity));
  shouldThrow(() => ctx.createImageData(10, NegInfinity));
  shouldThrow(() => ctx.createImageData(NaN, 10));
  shouldThrow(() => ctx.createImageData(10, NaN));
}
