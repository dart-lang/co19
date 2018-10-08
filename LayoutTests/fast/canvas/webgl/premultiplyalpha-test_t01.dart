/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the WebGL premultipledAlpha context creation flag.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

class _Test {
  var creationAttributes;
  var sentColor;
  var expectedColor;
  var errorRange;
  var imageFormat;
  _Test({creationAttributes,sentColor,expectedColor,errorRange,imageFormat}) {
    this.creationAttributes = creationAttributes;
    this.sentColor = sentColor;
    this.expectedColor = expectedColor;
    this.errorRange = errorRange;
    this.imageFormat = imageFormat;
  }
}

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var tests = [
    // If premultipledAlpha is true then
    // [texture]           [canvas]             [dataURL]
    // 32, 64, 128, 128 -> 64, 128, 255, 128 -> 64, 128, 255, 128
  new _Test( creationAttributes: {},
    sentColor: [32, 64, 128, 128],
    expectedColor: [64, 128, 255, 128],
    errorRange: 2,
    imageFormat: "image/png"
  ),
    // If premultipledAlpha is true then
    // [texture]           [canvas]             [texture]
    // 32, 64, 128, 128 -> 64, 128, 255, 128 -> 64, 128, 255, 128
  new _Test( creationAttributes: {},
    sentColor: [32, 64, 128, 128],
    expectedColor: [64, 128, 255, 128],
    errorRange: 2
  ),
  // If premultipledAlpha is false then
  // [texture]           [canvas]            [dataURL]
  // 255, 192, 128, 1 -> 255, 192, 128, 1 -> 255, 192, 128, 1
  new _Test( creationAttributes: {'premultipliedAlpha': false},
    sentColor: [255, 192, 128, 1],
    expectedColor: [255, 192, 128, 1],
    errorRange: 0,
    imageFormat: "image/png"
  ),
  // If premultipledAlpha is false then
  // [texture]           [canvas]            [texture]
  // 255, 192, 128, 1 -> 255, 192, 128, 1 -> 255, 192, 128, 1
  new _Test( creationAttributes: {'premultipliedAlpha': false},
    sentColor: [255, 192, 128, 1],
    expectedColor: [255, 192, 128, 1],
    errorRange: 0
  ),
  // If premultipledAlpha is false then
  // [texture]             [canvas]            [dataURL]
  // 255, 255, 255, 128 -> 255, 255, 255, 128 -> 128, 128, 128, 255
  new _Test( creationAttributes: {'premultipliedAlpha': false},
    sentColor: [255, 255, 255, 128],
    expectedColor: [128, 128, 128, 255],
    errorRange: 2,
    imageFormat: "image/jpeg"
  ),
  // If premultipledAlpha is true then
  // [texture]             [canvas]            [dataURL]
  // 128, 128, 128, 128 -> 255, 255, 255, 128 -> 128, 128, 128, 255
  new _Test( creationAttributes: {},
    sentColor: [128, 128, 128, 128],
    expectedColor: [128, 128, 128, 255],
    errorRange: 2,
    imageFormat: "image/jpeg"
  )
  ];

  var g_count = 0;
  var gl;
  var canvas;

  doNextTest() {
    if (g_count < tests.length) {
      var test = tests[g_count++];
      canvas = document.createElement("canvas");
      // Need to preserve drawing buffer to load it in a callback
      test.creationAttributes['preserveDrawingBuffer'] = true;
      gl = wtu.create3DContext(canvas, test.creationAttributes);
      var premultipliedAlpha = test.creationAttributes['premultipliedAlpha'] != false;
      debug("testing: premultipliedAlpha: $premultipliedAlpha imageFormat: ${test.imageFormat}");

      // N/A as of 2014.06.22
      //shouldBe(gl.getContextAttributes().premultipledAlpha, premultipledAlpha);
      //shouldBeTrue(gl.getContextAttributes().preserveDrawingBuffer);

      var program = wtu.setupTexturedQuad(gl);

      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");
      var tex = gl.createTexture();
      wtu.fillTexture(gl, tex, 2, 2, test.sentColor, 0);
      var loc = gl.getUniformLocation(program, "tex");
      gl.uniform1i(loc, 0);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.LINEAR);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);

      wtu.drawQuad(gl);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from drawing.");

      loadTexture(event) {
        var pngTex = gl.createTexture();
        // not needed as it's the default
        // gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
        gl.pixelStorei(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL, 0);
        gl.bindTexture(wgl.WebGL.TEXTURE_2D, pngTex);
        if (test.imageFormat != null) {
          // create texture from image
          gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, event.target);
        } else {
          // create texture from canvas
          gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas);
        }
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.LINEAR);
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
        glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from creating copy.");
        wtu.drawQuad(gl);
        glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from 2nd drawing.");
        wtu.checkCanvas(
            gl, test.expectedColor,
            "should draw with ${test.expectedColor}", test.errorRange);

        doNextTest();
      }

      if (test.imageFormat != null) {
        // Load canvas into string using toDataURL
        var imageUrl = canvas.toDataUrl(test.imageFormat);
        if (test.imageFormat != "image/png" &&
            (imageUrl.indexOf("data:image/png,") == 0 ||
             imageUrl.indexOf("data:image/png;") == 0)) {
               debug("Image format " + test.imageFormat + " not supported; skipping");
               setTimeout(doNextTest, 0);
             } else {
               // Load string into the texture
               dynamic input = document.createElement("img");
               input.onLoad.listen(loadTexture);
               input.src = imageUrl;
             }
      } else {
        // Load canvas into the texture asynchronously (to prevent unbounded stack consumption)
        setTimeout(loadTexture(null), 0);
      }
    } else {
      asyncEnd();
    }
  }
  asyncStart();
  doNextTest();
}
