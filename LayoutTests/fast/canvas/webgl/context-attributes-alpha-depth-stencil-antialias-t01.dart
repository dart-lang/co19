/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify WebGLContextAttributes are working as specified,
 * including alpha, depth, stencil, antialias, but not premultipliedAlpha
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec3 pos;
      attribute vec4 colorIn;
      varying vec4 color;

      void main()
      {
          color = colorIn;
          gl_Position = vec4(pos.xyz, 1.0);
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
      precision mediump float;

      varying vec4 color;

      void main()
      {
          gl_FragColor = color;
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  // These four declarations need to be global for "shouldBe" to see them
  var gl;
  var contextAttribs = null;
  var pixel = [0, 0, 0, 1];
  var correctColor = null;
  var framebuffer;
  var fbHasColor;
  var fbHasDepth;
  var fbHasStencil;

  getWebGL(canvasWidth, canvasHeight, contextAttribs, clearColor, clearDepth, clearStencil)
  {
    dynamic canvas = document.createElement("canvas");
    if (canvas == null)
      return null;
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;

    gl = create3DContext(canvas, contextAttribs);
    if (gl == null)
      return null;

    var program = createProgram(gl, "vshader", "fshader", ["pos", "colorIn"]);
    if (program == null)
      return null;

    gl.useProgram(program);

    gl.enable(wgl.WebGL.DEPTH_TEST);
    gl.enable(wgl.WebGL.STENCIL_TEST);
    gl.disable(wgl.WebGL.BLEND);

    gl.clearColor(clearColor[0], clearColor[1], clearColor[2], clearColor[3]);
    gl.clearDepth(clearDepth);
    gl.clearStencil(clearStencil);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT | wgl.WebGL.STENCIL_BUFFER_BIT);

    framebuffer = gl.createFramebuffer();
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, framebuffer);
    var texture = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, gl.canvas.width, gl.canvas.height, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
    gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, texture, 0);
    fbHasStencil = false;
    fbHasDepth = false;
    fbHasColor = gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE;
    if (fbHasColor) {
      var depthStencil = gl.createRenderbuffer();
      gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, depthStencil);
      gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.DEPTH_STENCIL, gl.canvas.width, gl.canvas.height);
      gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, wgl.WebGL.RENDERBUFFER, depthStencil);
      fbHasDepth = gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE;
      if (!fbHasDepth) {
        gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, wgl.WebGL.RENDERBUFFER, null);
        shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
      } else {
        fbHasStencil = true;
      }
    }
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "should be no errors");

    return gl;
  }

  drawAndReadPixel(gl, vertices, colors, x, y)
  {
    var colorOffset = vertices.lengthInBytes;

    var vbo = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vbo);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, colorOffset + colors.lengthInBytes, wgl.WebGL.STATIC_DRAW);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 0, vertices);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, colorOffset, colors);

    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(1, 4, wgl.WebGL.UNSIGNED_BYTE, true, 0, colorOffset);
    gl.enableVertexAttribArray(1);

    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, vertices.length ~/ 3);

    var buf = new Uint8List(1 * 1 * 4);
    gl.readPixels(x, y, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    return buf;
  }

  testDefault()
  {
    debug("Testing default attributes: { stencil:false }");
    shouldBeNonNull(gl = getWebGL(1, 1, null, [ 0, 0, 0, 0 ], 1, 0));
    shouldBeFalse(gl.getContextAttributes().stencil);
    shouldBeTrue(gl.getParameter(wgl.WebGL.STENCIL_BITS) == 0);
  }

  testAlpha(alpha)
  {
    debug("Testing alpha = $alpha");
    if (alpha) {
      shouldBeNonNull(gl = getWebGL(1, 1, { 'alpha': true, 'depth': false, 'stencil': false, 'antialias': false }, [ 0, 0, 0, 0 ], 1, 0));
      shouldBeTrue(gl.getParameter(wgl.WebGL.ALPHA_BITS) >= 8);
    } else {
      shouldBeNonNull(gl = getWebGL(1, 1, { 'alpha': false, 'depth': false, 'stencil': false, 'antialias': false }, [ 0, 0, 0, 0 ], 1, 0));
      shouldBeTrue(gl.getParameter(wgl.WebGL.ALPHA_BITS) == 0);
    }
    shouldBeTrue(gl.getParameter(wgl.WebGL.RED_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.GREEN_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.BLUE_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.DEPTH_BITS) == 0);
    shouldBeTrue(gl.getParameter(wgl.WebGL.STENCIL_BITS) == 0);

    shouldBeNonNull(contextAttribs = gl.getContextAttributes());
    shouldBeTrue(contextAttribs.alpha == alpha);

    var buf = new Uint8List(1 * 1 * 4);
    gl.readPixels(0, 0, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    pixel[0] = buf[0];
    pixel[1] = buf[1];
    pixel[2] = buf[2];
    pixel[3] = buf[3];
    correctColor = (contextAttribs.alpha ? [0, 0, 0, 0] : [0, 0, 0, 255]);
    shouldBeList(pixel, correctColor);

    if (fbHasColor) {
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, framebuffer);
      gl.clearColor(0.5, 0.5, 0.5, 0.5);
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
      gl.readPixels(0, 0, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      pixel[0] = buf[0];
      pixel[1] = buf[1];
      pixel[2] = buf[2];
      pixel[3] = buf[3];
      shouldBeTrue((pixel[0] - 127).abs() <= 1 && (pixel[1] - 127).abs() <= 1
          && (pixel[2] - 127).abs() <= 1 && (pixel[3] - 127).abs() <= 1);
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
    }
  }

  testDepth(depth)
  {
    debug("Testing depth = $depth");
    if (depth) {
      shouldBeNonNull(gl = getWebGL(1, 1, { 'stencil': false, 'antialias': false }, [ 0, 0, 0, 1 ], 1, 0));
      shouldBeTrue(gl.getParameter(wgl.WebGL.DEPTH_BITS) >= 16);
    } else {
      shouldBeNonNull(gl = getWebGL(1, 1, { 'depth': false, 'stencil': false, 'antialias': false }, [ 0, 0, 0, 1 ], 1, 0));
      shouldBeTrue(gl.getParameter(wgl.WebGL.DEPTH_BITS) == 0);
    }
    shouldBeTrue(gl.getParameter(wgl.WebGL.RED_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.GREEN_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.BLUE_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.ALPHA_BITS) >= 8);

    shouldBeNonNull(contextAttribs = gl.getContextAttributes());

    gl.depthFunc(wgl.WebGL.NEVER);

    var vertices = new Float32List.fromList([
        1.0,  1.0, 0.0,
        -1.0,  1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0,  1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0]);
    var colors = new Uint8List.fromList([
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255]);

    var buf = drawAndReadPixel(gl, vertices, colors, 0, 0);
    pixel[0] = buf[0];
    pixel[1] = buf[1];
    pixel[2] = buf[2];
    pixel[3] = buf[3];
    correctColor = (contextAttribs.depth ? [0, 0, 0, 255] : [255, 0, 0, 255]);
    shouldBeList(pixel, correctColor);

    if (fbHasDepth) {
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, framebuffer);
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
      var buf = drawAndReadPixel(gl, vertices, colors, 0, 0);
      pixel[0] = buf[0];
      pixel[1] = buf[1];
      pixel[2] = buf[2];
      pixel[3] = buf[3];
      shouldBeList(pixel, [0, 0, 0, 255]);
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
    }
  }

  testStencilAndDepth(stencil, depth)
  {
    debug("Testing stencil = $stencil, depth = $depth");
    shouldBeNonNull(gl = getWebGL(1, 1, { 'depth': depth, 'stencil': stencil, 'antialias': false }, [ 0, 0, 0, 1 ], 1, 0));

    shouldBeTrue(gl.getParameter(wgl.WebGL.RED_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.GREEN_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.BLUE_BITS) >= 8);
    shouldBeTrue(gl.getParameter(wgl.WebGL.ALPHA_BITS) >= 8);
    if (depth)
      shouldBeTrue(gl.getParameter(wgl.WebGL.DEPTH_BITS) >= 16);
    else
      shouldBeTrue(gl.getParameter(wgl.WebGL.DEPTH_BITS) == 0);

    if (stencil)
      shouldBeTrue(gl.getParameter(wgl.WebGL.STENCIL_BITS) >= 8);
    else
      shouldBeTrue(gl.getParameter(wgl.WebGL.STENCIL_BITS) == 0);

    shouldBeNonNull(contextAttribs = gl.getContextAttributes());
    if (!depth && contextAttribs.depth) {
      testFailed("WebGL implementation provided a depth buffer when it should not have");
    }
    if (!contextAttribs.depth)
      depth = false;
    if (!stencil && contextAttribs.stencil) {
      testFailed("WebGL implementation provided a stencil buffer when it should not have");
    }
    if (!contextAttribs.stencil)
      stencil = false;

    gl.depthFunc(wgl.WebGL.ALWAYS);

    gl.stencilFunc(wgl.WebGL.NEVER, 1, 1);
    gl.stencilOp(wgl.WebGL.KEEP, wgl.WebGL.KEEP, wgl.WebGL.KEEP);

    var vertices = new Float32List.fromList([
        1.0, 1.0, 0.0,
        -1.0, 1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, 1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0]);
    var colors = new Uint8List.fromList([
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255]);

    var buf = drawAndReadPixel(gl, vertices, colors, 0, 0);
    pixel[0] = buf[0];
    pixel[1] = buf[1];
    pixel[2] = buf[2];
    pixel[3] = buf[3];
    correctColor = (stencil ? [0, 0, 0, 255] : [255, 0, 0, 255]);
    shouldBeList(pixel, correctColor);

    if (fbHasStencil) {
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, framebuffer);
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
      var buf = drawAndReadPixel(gl, vertices, colors, 0, 0);
      pixel[0] = buf[0];
      pixel[1] = buf[1];
      pixel[2] = buf[2];
      pixel[3] = buf[3];
      shouldBeList(pixel, [0, 0, 0, 255]);
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
    }
  }

  testAntialias(antialias)
  {
    debug("Testing antialias = $antialias");
    if (antialias)
      shouldBeNonNull(gl = getWebGL(2, 2, { 'depth': false, 'stencil': false, 'alpha': false, 'antialias': true }, [ 0, 0, 0, 1 ], 1, 0));
    else
      shouldBeNonNull(gl = getWebGL(2, 2, { 'depth': false, 'stencil': false, 'alpha': false, 'antialias': false }, [ 0, 0, 0, 1 ], 1, 0));
    shouldBeNonNull("contextAttribs = gl.getContextAttributes()");

    var vertices = new Float32List.fromList([
        1.0, 1.0, 0.0,
        -1.0, 1.0, 0.0,
        -1.0, -1.0, 0.0]);
    var colors = new Uint8List.fromList([
        255, 0, 0, 255,
        255, 0, 0, 255,
        255, 0, 0, 255]);
    var buf = drawAndReadPixel(gl, vertices, colors, 0, 0);
    pixel[0] = buf[0];
    shouldBe(pixel[0] != 255 && pixel[0] != 0, contextAttribs.antialias);
  }

  testDefault();
  testAlpha(true);
  testAlpha(false);
  testDepth(true);
  testDepth(false);
  testStencilAndDepth(true, false);
  testStencilAndDepth(false, false);
  testStencilAndDepth(true, true);
  testStencilAndDepth(false, true);
  testAntialias(true);
  testAntialias(false);
}

