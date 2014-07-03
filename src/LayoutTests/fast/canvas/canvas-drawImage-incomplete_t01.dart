/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that drawImage() does nothing with an incomplete image or
 * video
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement("canvas");
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(0,0,150,150);

  var img = new ImageElement();
  img.src = '';

  var video = document.createElement("video");

  shouldBe(ctx.drawImage(img, 0, 0), null);

  var imgdata = ctx.getImageData(0, 0, 1, 1).data;
  shouldBe(imgdata[0], 255);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);

  shouldBe(ctx.drawImage(video, 0, 0), null);

  imgdata = ctx.getImageData(0, 0, 1, 1).data;
  shouldBe(imgdata[0], 255);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);
}

