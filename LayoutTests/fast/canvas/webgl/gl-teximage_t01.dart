/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test texImage2D conversions.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="256" height="16" style="width: 256px; height: 48px;"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);
  var program = wtu.setupTexturedQuad(gl);

  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  var imgURLs = [
    '$root/resources/gray-ramp-256-with-128-alpha.png',
    '$root/resources/gray-ramp-256.png',
    '$root/resources/gray-ramp-default-gamma.png',
    '$root/resources/gray-ramp-gamma0.1.png',
    '$root/resources/gray-ramp-gamma1.0.png',
    '$root/resources/gray-ramp-gamma2.0.png',
    '$root/resources/gray-ramp-gamma4.0.png',
    '$root/resources/gray-ramp-gamma9.0.png',
    '$root/resources/gray-ramp.png',
    '$root/resources/zero-alpha.png',
    '$root/resources/3x3.png',
    '$root/resources/blue-1x1.jpg',
    '$root/resources/red-indexed.png',
    '$root/resources/green-2x2-16bit.png',
    '$root/resources/small-square-with-colorspin-profile.jpg',
    '$root/resources/small-square-with-colorspin-profile.png',
    '$root/resources/small-square-with-cie-rgb-profile.png',
    '$root/resources/small-square-with-colormatch-profile.png',
    '$root/resources/small-square-with-e-srgb-profile.png',
    '$root/resources/small-square-with-smpte-c-profile.png',
    '$root/resources/small-square-with-srgb-iec61966-2.1-profile.png'];


  runTests(imgs) {
    var loc = gl.getUniformLocation(program, "tex");
    gl.uniform1i(loc, 0);

    gl.disable(wgl.WebGL.BLEND);
    gl.disable(wgl.WebGL.DEPTH_TEST);

    var width = canvas.width;
    var height = canvas.height;

    checkPixel(buf, x, y, color) {
      var off = (y * width + x) * 4;
      var msg = "pixel $x,$y should be $color, was ${buf.sublist(off,off+4)}";

      for (var ii = 0; ii < 4; ++ii) {
        if (buf[off + ii] != color[ii]) {
          testFailed(msg);
          return;
        }
      }
      testPassed(msg);
    }

    checkPixelRange(buf, x, y, color, allowedRange) {
      var off = (y * width + x) * 4;
      var msg = "pixel $x,$y should be within $allowedRange units of $color"+
        " was ${buf.sublist(off,off+4)}";
      // When running in WebKit's test harness, we don't want to print the
      // pixel value when the test passes, because different machines might
      // have different results and we record the text output.
      for (var ii = 0; ii < 4; ++ii) {
        if (abs(buf[off + ii] - color[ii]) > allowedRange) {
          testFailed(msg);
          return;
        }
      }
      testPassed(msg);
    }

    var tex = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);

    var buf = new Uint8List(width * height * 4);

    debug("check pixels are NOT pre-multiplied");
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/zero-alpha.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);

    var left = 0;
    var middle = floor(width / 2);
    var right = width - 1;
    var bottom = 0;
    var center = floor(height / 2);
    var top = height - 1;
    checkPixel(buf, left,   top,    [  0,   0,   0, 255]);
    checkPixel(buf, middle, top,    [255,   0, 255, 255]);
    checkPixel(buf, right,  top,    [  0,   0, 255, 255]);
    checkPixel(buf, left,   center, [128, 128, 128, 255]);
    checkPixel(buf, middle, center, [255, 255, 255, 255]);
    checkPixel(buf, right,  center, [  0, 255, 255, 255]);
    checkPixel(buf, left,   bottom, [255,   0,   0, 255]);
    checkPixel(buf, middle, bottom, [255, 255,   0, 255]);
    checkPixel(buf, right,  bottom, [  0, 255,   0, 255]);

    debug("check quantization");
    var quantInfo = [
    {'format': wgl.WebGL.RGBA, 'type': wgl.WebGL.UNSIGNED_BYTE,          'counts': [256, 256, 256, 256]},
    {'format': wgl.WebGL.RGBA, 'type': wgl.WebGL.UNSIGNED_SHORT_4_4_4_4, 'counts': [ 16,  16,  16,  16]},
    {'format': wgl.WebGL.RGB,  'type': wgl.WebGL.UNSIGNED_SHORT_5_6_5,   'counts': [ 32,  64,  32,   1]},
    {'format': wgl.WebGL.RGBA, 'type': wgl.WebGL.UNSIGNED_SHORT_5_5_5_1, 'counts': [ 32,  32,  32,   2]}];
    for (var qq = 0; qq < quantInfo.length; ++qq) {
      dynamic info = quantInfo[qq];
      gl.texImage2D(
          wgl.WebGL.TEXTURE_2D, 0, info['format'], info['format'], info['type'],
          imgs['$root/resources/gray-ramp-256.png']);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");
      wtu.drawQuad(gl);
      gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      var counts = [{ }, { }, { }, { }];
      var numUniqueValues = [0, 0, 0, 0];
      // Count the number of unique values in each channel.
      for (var ii = 0; ii < width * height * 4; ii += 4) {
        for (var jj = 0; jj < 4; ++jj) {
          var v = buf[ii + jj];
          if (counts[jj][v] == null) {
            counts[jj][v] = 1;
            ++numUniqueValues[jj];
          } else {
            ++counts[jj][v];
          }
        }
      }
      for (var ii = 0; ii < 4; ++ii) {
        assertMsg(numUniqueValues[ii] == info['counts'][ii],
            "There should be ${info['counts'][ii]}" +
            " unique values in channel $ii. Found " +
            "${numUniqueValues[ii]}");
      }
    }

    debug("Check that gamma settings don't effect 8bit pngs");
    gl.pixelStorei(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL, wgl.WebGL.NONE);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/gray-ramp-default-gamma.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");
    wtu.drawQuad(gl);
    var ref = new Uint8List(width * height * 4);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, ref);

    var gammaImages = [
      '$root/resources/gray-ramp-gamma0.1.png',
      '$root/resources/gray-ramp-gamma1.0.png',
      '$root/resources/gray-ramp-gamma2.0.png',
      '$root/resources/gray-ramp-gamma4.0.png',
      '$root/resources/gray-ramp-gamma9.0.png'];
    for (var ii = 0; ii < gammaImages.length; ++ii) {
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
          imgs[gammaImages[ii]]);
      wtu.drawQuad(gl);
      gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      var same = true;
      for (var jj = 0; jj < width * height * 4; ++jj) {
        if (buf[jj] != ref[jj]) {
          same = false;
          break;
        }
      }
      assertMsg(same, "pixels should be same regardless of gamma settings.");
    }

    debug("check pixels are UN pre-multiplied");
    for (var ii = 0; ii < 2; ++ii) {
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 1, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
      if (ii == 0) {
        dynamic canvas2d = document.createElement("canvas");
        canvas2d.width = 256;
        canvas2d.height = 1;
        var ctx = canvas2d.getContext("2d");
        ctx.drawImage(imgs['$root/resources/gray-ramp-256-with-128-alpha.png'], 0, 0);
        gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE, canvas2d);
      } else {
        gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
            imgs['$root/resources/gray-ramp-256-with-128-alpha.png']);
      }
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");
      wtu.drawQuad(gl);
      var buf = new Uint8List(width * height * 4);
      gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      var lt128Count = [0, 0, 0];
      var ge128Count = [0, 0, 0];
      for (var jj = 0; jj < width; ++jj) {
        var off = jj * 4;
        for (var cc = 0; cc < 3; ++cc) {
          if (buf[off + cc] < 128) {
            ++lt128Count[cc];
          } else {
            ++ge128Count[cc];
          }
        }
      }
      // Not sure the exact count here because gamma does effect drawing into the
      // canvas but it should be close to 50% so I'll pass 45%
      for (var jj = 0; jj < 3; ++jj) {
        // Only display the actual percentage string when outside of the test
        // harness, to prevent safe variation from causing failures.
        assertMsg(ge128Count[jj] > 256 * 0.45,
            "Half the pixels in channel $jj"
            " should be >= 128,128,128. " +
            "found ${((ge128Count[jj] / 256) * 100).floor()}%");
        assertMsg(lt128Count[jj] > 256 * 0.45,
            "Half the pixels in channel $jj" +
            " should be < 128,128,128. " +
            "found ${((lt128Count[jj] / 256) * 100).floor()}%");
      }
    }

    debug("check canvas pixels are UN pre-multiplied");
    dynamic canvas2d = document.createElement("canvas");
    canvas2d.width = 1;
    canvas2d.height = 1;
    var ctx = canvas2d.getContext("2d");
    ctx.fillStyle ="rgba(255,255,255,0.5)";
    ctx.fillRect(0, 0, 256, 1);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas2d);
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");
    checkPixelRange(buf, 0, 0, [255, 255, 255, 127], 4);

    debug("check canvas pixels are pre-multiplied");
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 1);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas2d);
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");
    checkPixelRange(buf, 0, 0, [127, 127, 127, 127], 4);

    debug("check pixels are pre-multiplied");
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 1);
    // TODO(gman): use different texture that won't pass on failure
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/zero-alpha.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);

    var same = true;
    for (var jj = 0; jj < width * height * 4; ++jj) {
      if (buf[jj] != 0) {
        same = false;
        break;
      }
    }
    assertMsg(same, "pixels should all be 0.");

    debug("check pixels are flipped");
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 1);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/3x3.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);

    checkPixel(buf, left,   top,    [255,   0,   0, 255]);
    checkPixel(buf, middle, top,    [255, 255,   0, 255]);
    checkPixel(buf, right,  top,    [255,   0,   0, 255]);
    checkPixel(buf, left,   center, [255,   0, 255, 255]);
    checkPixel(buf, middle, center, [255,   0,   0, 255]);
    checkPixel(buf, right,  center, [  0, 255,   0, 255]);
    checkPixel(buf, left,   bottom, [  0,   0,   0, 255]);
    checkPixel(buf, middle, bottom, [  0,   0, 255, 255]);
    checkPixel(buf, right,  bottom, [255,   0,   0, 255]);

    debug("check uploading of images with no alpha channel works");
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 0);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/blue-1x1.jpg']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    checkPixelRange(buf, middle, center, [   0,   0, 255, 255], 10);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors");

    debug("check uploading of 16-bit images");
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 0);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/green-2x2-16bit.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    checkPixelRange(buf, middle, center, [   15, 121,   0, 255], 10);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors");

    debug("check uploading of images with ICC profiles");
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL, wgl.WebGL.NONE);

    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/small-square-with-colorspin-profile.jpg']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    // The image is red.  However, if we ignore the color profile, it is blue.
    checkPixelRange(buf, middle, center, [ 0, 0, 255, 255], 10);

    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/small-square-with-colorspin-profile.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    // The image is red.  However, if we ignore the color profile, it is blue.
    checkPixelRange(buf, middle, center, [ 0, 0, 255, 255], 10);

    var iccPNGs = [
      '$root/resources/small-square-with-cie-rgb-profile.png',
      '$root/resources/small-square-with-colormatch-profile.png',
      '$root/resources/small-square-with-e-srgb-profile.png',
      '$root/resources/small-square-with-smpte-c-profile.png',
      '$root/resources/small-square-with-srgb-iec61966-2.1-profile.png'];
    for (var ii = 0; ii < iccPNGs.length; ++ii) {
        var buf2 = new Uint8List(width * height * 4);
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
          imgs[iccPNGs[ii]]);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
      wtu.drawQuad(gl);
      gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf2);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors");
      var same = true;
      for (var jj = 0; jj < buf.length; ++jj) {
        if (buf[jj] != buf2[jj]) {
          same = false;
          break;
        }
      }
      assertMsg(same, "uploading PNGs with same data but various ICC profiles should generate the same results");
    }

    debug("check uploading of indexed PNG images");
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGB, wgl.WebGL.RGB, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/red-indexed.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    // The image should be red.
    checkPixelRange(buf, middle, center, [ 255, 0, 0, 255 ], 10);

    asyncEnd();
  }

  asyncStart();
  wtu.loadImagesAsync(imgURLs, runTests);
}
