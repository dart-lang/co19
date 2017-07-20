/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test loading a large texture using texImage2D
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
//import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width="64" height="64"></canvas>
      <div id="console"></div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  andPixels(pixels32) {
    var pixelsAnd = 0xffffffff;
    for (var i = 0; i < pixels32.length; ++i) {
      pixelsAnd &= pixels32[i];
    }
    return pixelsAnd;
  }

  runTest() {
    var width = 3900;
    var height = 3900;

    var canvas = document.getElementById('canvas');
    var gl = canvas.getContext('webgl');

    gl.pixelStorei(wgl.UNPACK_COLORSPACE_CONVERSION_WEBGL, wgl.NONE);

    var texture = gl.createTexture();
    gl.bindTexture(wgl.TEXTURE_2D, texture);

    var image = new ImageElement();
    image.onError.listen((e) {
      testFailed('Image failed to load');
    });
    image.onLoad.listen((e) {
      debug('Image width and height: ${image.width}, ${image.height}');

      if (image.width != width || image.height != height) {
        testFailed('Image did not have expected dimensions.');
        return;
      }

      var pixels8 = new Uint8List(width * height * 4);
      var pixels32 = new Uint32List.view(pixels8.buffer);

      if (width > gl.getParameter(wgl.MAX_TEXTURE_SIZE) ||
          width > gl.getParameter(wgl.MAX_RENDERBUFFER_SIZE)) {
          // The image is allowed to be too big to be used as a texture.
          asyncEnd();
          return;
      }

      gl.texImage2DImage(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE, image);
      if (gl.getError() != wgl.NO_ERROR) {
        // Loading the texture is allowed to fail due to resource constraints.
        asyncEnd();
        return;
      }
      var fb = gl.createFramebuffer();
      gl.bindFramebuffer(wgl.FRAMEBUFFER, fb);
      gl.framebufferTexture2D(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.TEXTURE_2D, texture, 0);
      gl.readPixels(0, 0, width, height, wgl.RGBA, wgl.UNSIGNED_BYTE, pixels8);

      // The image is filled with white, ignore last bit of each subpixel to account for decoding rounding differences.
      if ((andPixels(pixels32) & 0xfefefefe) != (0xfefefefe | 0)) {
        testFailed('Texture was not loaded correctly.');
      }

      debug('loaded and passed the test');
      asyncEnd();
    });
    image.src = '$root/resources/white3900x3900.jpg';
  }

  asyncStart();
  runTest();
}
