/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Ensure that globalAlpha is applied correctly to text.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = "black";
  ctx.globalAlpha = 0.5;
  ctx.font = "50px Arial";
  ctx.fillText("A",50,50);
  var imageData = ctx.getImageData(63, 22, 1, 1);
  var imgdata = imageData.data;
  shouldBeTrue(imgdata[3] == 127 || imgdata[3] == 128);
}
