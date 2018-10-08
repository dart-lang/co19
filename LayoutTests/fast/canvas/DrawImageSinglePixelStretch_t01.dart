/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>DrawImage with a source of a single pixel should draw one uniform color throughout. Neighboring pixels in the source image shouldn't affect the destination rect's output pixels</p>
      <p>(Bugzilla: https://bugs.webkit.org/show_bug.cgi?id=58267) (Radar: rdar://problem/9148473)</p>

      <p> This canvas should be uniformly one color </p>
      <canvas id="c"</canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var image;
  dynamic ctx;

  areEqual(a, b) {
    return a[0] == b[0] && a[1] == b[1] && a[2] == b[2] && a[3] == b[3];
  }

  getPixel(ctx, x, y) {
    var idata = ctx.getImageData(x,y,1,1);
    return idata.data;
  }

  isRowUniform(ctx, y) {
    var start = getPixel(ctx, 0, y);

    for (var i = 0; i < ctx.canvas.width; i++) {
      if (!areEqual(start, getPixel(ctx, i, y)))
        return false;
    }

    return true;
  }

  areAllRowsUniform(ctx) {
    for (var y = 0; y < ctx.canvas.height; y++) {
      if (!isRowUniform(ctx,y))
        return false;
    }

    return true;
  }

  checkPixels() {
    var passed = areAllRowsUniform(ctx);
    shouldBeTrue(passed);
    asyncEnd();
  }

  draw (_) {
    var w = ctx.canvas.width;
    var h = ctx.canvas.height;
    // part between left corner and arrow
    ctx.drawImageScaledFromSource(image, 3, 2, 1, 1,
        0, 0, w, h);
    setTimeout(checkPixels, 0);
  }

  init () {
    dynamic canvas = document.getElementById("c");
    canvas.width = 200;
    canvas.height = 50;
    ctx = canvas.getContext('2d');

    image = new ImageElement();
    image.addEventListener('load', draw, false);
    image.src = '$root/resources/orangePixels.gif';
  }

  asyncStart();
  init();
}
