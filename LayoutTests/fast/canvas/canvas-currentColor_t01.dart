/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that CanvasRenderingContext2D supports the 'currentColor'
 * value.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');
  canvas.width = 100;
  canvas.height = 100;
  var ctx = canvas.getContext('2d');

  attachCanvasToDocument() {
    document.body.append(canvas);
    return document.body.parentNode != null;
  }

  tryLinearGradientColor(color) {
    var gradient = ctx.createLinearGradient(0, 0, 100, 100);
    gradient.addColorStop(0, color);
    gradient.addColorStop(1, color);
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, 100, 100);
    var data = ctx.getImageData(0, 0, 1, 1).data;
    return data.join(',');
  }

  tryRadialGradientColor(color) {
    var gradient = ctx.createRadialGradient(0, 0, 100, 100, 100, 100);
    gradient.addColorStop(0, color);
    gradient.addColorStop(1, color);
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, 100, 100);
    var data = ctx.getImageData(0, 0, 1, 1).data;
    return data.join(',');
  }

  // First we test with the canvas out-of-document, 'currentColor' should mean
  // black
  ctx.shadowColor = '#f00';
  shouldBe(ctx.shadowColor, '#ff0000');
  ctx.shadowColor = 'currentColor';
  shouldBe(ctx.shadowColor, '#000000');
  ctx.fillStyle = '#f00';
  shouldBe(ctx.fillStyle, '#ff0000');
  ctx.fillStyle = 'currentColor'; 
  shouldBe(ctx.fillStyle, '#000000');
  ctx.strokeStyle = '#f00';
  shouldBe(ctx.strokeStyle, '#ff0000');
  ctx.strokeStyle = 'currentColor';
  shouldBe(ctx.strokeStyle, '#000000');
  /*ctx.setShadow(0, 0, 0, '#f00');
  shouldBe(ctx.shadowColor, '#ff0000');
  ctx.setShadow(0, 0, 0, 'currentColor');
  shouldBe(ctx.shadowColor, '#000000');
  ctx.setShadow(0, 0, 0, '#f00', 0.0);
  shouldBe(ctx.shadowColor, 'rgba(255, 0, 0, 0)');
  ctx.setShadow(0, 0, 0, 'currentColor', 0.0);
  shouldBe(ctx.shadowColor, 'rgba(0, 0, 0, 0)');
  ctx.setStrokeColor('#f00');
  shouldBe(ctx.strokeStyle, '#ff0000');
  ctx.setStrokeColor('currentColor');
  shouldBe(ctx.strokeStyle, '#000000');
  ctx.setStrokeColor('#f00', 0.0);
  shouldBe(ctx.strokeStyle, 'rgba(255, 0, 0, 0)');
  ctx.setStrokeColor('currentColor', 0.0);
  shouldBe(ctx.strokeStyle, 'rgba(0, 0, 0, 0)');
  ctx.setFillColor('#f00');
  shouldBe(ctx.fillStyle, '#ff0000');
  ctx.setFillColor('currentColor');
  shouldBe(ctx.fillStyle, '#000000');
  ctx.setFillColor('#f00', 0.0);
  shouldBe(ctx.fillStyle, 'rgba(255, 0, 0, 0)');
  ctx.setFillColor('currentColor', 0.0);
  shouldBe(ctx.fillStyle, 'rgba(0, 0, 0, 0)');*/
  shouldBe(tryLinearGradientColor('#f00'), '255,0,0,255');
  shouldBe(tryLinearGradientColor('currentColor'), '0,0,0,255');
  shouldBe(tryRadialGradientColor('#f00'), '255,0,0,255');
  shouldBe(tryRadialGradientColor('currentColor'), '0,0,0,255');

  // Attach to the document and set the canvas's color to #123456
  shouldBe(attachCanvasToDocument(), true);
  canvas.style.color = '#123456';
  shouldBe(canvas.style.color, 'rgb(18, 52, 86)');

  // 'currentColor' should now mean #123456
  ctx.shadowColor = '#f00';
  shouldBe(ctx.shadowColor, '#ff0000');
  ctx.shadowColor = 'currentColor';
  shouldBe(ctx.shadowColor, '#123456');
  ctx.fillStyle = '#f00';
  shouldBe(ctx.fillStyle, '#ff0000');
  ctx.fillStyle = 'currentColor';
  shouldBe(ctx.fillStyle, '#123456');
  ctx.strokeStyle = '#f00';
  shouldBe(ctx.strokeStyle, '#ff0000');
  ctx.strokeStyle = 'currentColor';
  shouldBe(ctx.strokeStyle, '#123456');
  /*
  shouldBe(ctx.setShadow(0, 0, 0, '#f00'); ctx.shadowColor, '#ff0000');
  shouldBe(ctx.setShadow(0, 0, 0, 'currentColor'); ctx.shadowColor, '#123456');
  shouldBe(ctx.setShadow(0, 0, 0, '#f00', 0.0); ctx.shadowColor, 'rgba(255, 0, 0, 0)');
  shouldBe(ctx.setShadow(0, 0, 0, 'currentColor', 0.0); ctx.shadowColor, 'rgba(18, 52, 86, 0)');
  shouldBe(ctx.setStrokeColor('#f00'); ctx.strokeStyle, '#ff0000');
  shouldBe(ctx.setStrokeColor('currentColor'); ctx.strokeStyle, '#123456');
  shouldBe(ctx.setStrokeColor('#f00', 0.0); ctx.strokeStyle, 'rgba(255, 0, 0, 0)');
  shouldBe(ctx.setStrokeColor('currentColor', 0.0); ctx.strokeStyle, 'rgba(18, 52, 86, 0)');
  shouldBe(ctx.setFillColor('#f00'); ctx.fillStyle, '#ff0000');
  shouldBe(ctx.setFillColor('currentColor'); ctx.fillStyle, '#123456');
  shouldBe(ctx.setFillColor('#f00', 0.0); ctx.fillStyle, 'rgba(255, 0, 0, 0)');
  shouldBe(ctx.setFillColor('currentColor', 0.0); ctx.fillStyle, 'rgba(18, 52, 86, 0)');
  */
  shouldBe(tryLinearGradientColor('#f00'), '255,0,0,255');
  shouldBe(tryLinearGradientColor('currentColor'), '0,0,0,255');
  shouldBe(tryRadialGradientColor('#f00'), '255,0,0,255');
  shouldBe(tryRadialGradientColor('currentColor'), '0,0,0,255');

  // Last but not least, verify that we're case insensitive
  ctx.shadowColor = '#f00';
  shouldBe(ctx.shadowColor, '#ff0000');
  ctx.shadowColor = 'CURRENTCOLOR';
  shouldBe(ctx.shadowColor, '#123456');
}
