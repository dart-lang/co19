/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures WebGL implementations interact correctly with
 * the canvas tag.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";


runAfterDisplay(callback) {
    window.requestAnimationFrame((_) {
        // At this point, only the animate has happened, but no compositing
        // or layout.  Use a timeout for the callback so that notifyDone
        // can be called inside of it.
        setTimeout(callback, 0);
    });
}

main() {
  document.body.setInnerHtml('''
      <div id="description"></div>
      <div id="console"></div>
      <canvas id="canvas" style="width: 50px; height: 50px;"> </canvas>
      <canvas id="canvas2d" width="40" height="40"> </canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  dynamic canvas = document.getElementById("canvas");
  dynamic canvas2d = document.getElementById("canvas2d");
  var ctx2d = canvas2d.getContext("2d");
  var gl = create3DContext(canvas);
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    debug("Checking canvas and WebGL interaction");

    // Check that a canvas with no width or height is 300x150 pixels
    shouldBe(canvas.width, 300);
    shouldBe(canvas.height, 150);

    // Check get a 4 value gl parameter as a csv string.
    getValue4v(name) {
      var v = gl.getParameter(name);
      return v.join(',');
    }

    getViewport() {
      return getValue4v(wgl.WebGL.VIEWPORT);
    }

    getClearColor() {
      return getValue4v(wgl.WebGL.COLOR_CLEAR_VALUE);
    }

    isAboutEqual(a, b) {
      return (a - b).abs() < 0.01;
    }

    isAboutEqualInt(a, b) {
      return (a - b).abs() < 3;
    }

    checkCanvasContentIs(r3d,g3d,b3d,a3d) {
      var r2d;
      var g2d;
      var b2d;
      var a2d;
      var imgData;

      checkPixel(x, y, r3d,g3d,b3d,a3d) {
        var offset = (y * 40 + x) * 4;
        r2d = imgData.data[offset];
        g2d = imgData.data[offset + 1];
        b2d = imgData.data[offset + 2];
        a2d = imgData.data[offset + 3];
        //debug('$x,$y($offset) = $r2d,$g2d,$b2d,$a2d');
        return isAboutEqualInt(r2d, r3d) &&
          isAboutEqualInt(g2d, g3d) &&
          isAboutEqualInt(b2d, b3d) &&
          isAboutEqualInt(a2d, a3d);
      }

      checkPixels(r3d,g3d,b3d,a3d) {
        return checkPixel(0, 0, r3d, g3d, b3d, a3d) &&
          checkPixel(0, 39, r3d, g3d, b3d, a3d) &&
          checkPixel(39, 0, r3d, g3d, b3d, a3d) &&
          checkPixel(39, 39, r3d, g3d, b3d, a3d) &&
          checkPixel(0, 0, r3d, g3d, b3d, a3d);
      };

      // Set to just take the color from the 3d canvas
      ctx2d.globalCompositeOperation = 'copy';

      // fill 2d canvas with orange
      ctx2d.fillStyle = "rgb(255,192,128)";
      ctx2d.fillRect (0, 0, 40, 40);

      // get the image data
      imgData = ctx2d.getImageData(0, 0, 40, 40);

      // check it got cleared.
      if (!checkPixels(255, 192, 128, 255)) {
        testFailed("unable to fill 2d context.");
        return;
      }

      // draw 3d canvas on top.
      ctx2d.drawImageScaled(canvas, 0,0, 40, 40);

      // get the image data
      imgData = ctx2d.getImageData(0, 0, 40, 40);

      // Check it's the expected color.
      if (!checkPixels(r3d, g3d, b3d, a3d)) {
        testFailed("pixels are $r2d,$g2d,$b2d,$a2d expected $r3d,$g3d,$b3d,$a3d");
      } else {
        testPassed("pixels are $r3d,$g3d,$b3d,$a3d");
      }
    }

    checkCanvasContentIs(0, 0, 0, 0);
    shouldBe(getViewport(), "0,0,300,150");

    // Change the display size of the canvas and check
    // the viewport size does not change.
    debug("change display size of canvas and see that viewport does not change");
    canvas.style.width = "100px";
    canvas.style.height = "25px";

    asyncStart();

    runAfterDisplay(() {
      if (canvas.clientWidth == 100 &&
        canvas.clientHeight == 25) {
          shouldBe(getViewport(), "0,0,300,150");
          shouldBe(canvas.width, 300);
          shouldBe(canvas.height, 150);

          // Change the actual size of the canvas
          // Check that the viewport does not change.
          // Check that the clear color does not change.
          // Check that the color mask does not change.
          debug("change the actual size of the canvas and see that the viewport does not change");
          gl.clearColor(0.25, 0.5, 0.75, 1);
          gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
          checkCanvasContentIs(64, 128, 192, 255);
          gl.colorMask(false, false, false, false);
          canvas.width = 400;
          canvas.height = 10;

          var v = gl.getParameter(wgl.WebGL.COLOR_CLEAR_VALUE);
          assertMsg(isAboutEqual(v[0], 0.25) &&
            isAboutEqual(v[1], 0.5) &&
            isAboutEqual(v[2], 0.75) &&
            isAboutEqual(v[3], 1),
            "gl.clearColor should not change after canvas resize");
          v = gl.getParameter(wgl.WebGL.COLOR_WRITEMASK);
          assertMsg(v[0] == false &&
            v[1] == false &&
            v[2] == false &&
            v[3] == false,
            "gl.colorMask should not change after canvas resize");
          shouldBe(getViewport(), "0,0,300,150");
          checkCanvasContentIs(0, 0, 0, 0);
          asyncEnd();
        }
    });
  }
}
