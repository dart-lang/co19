/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checking API, no asserts
 * This test is only useful as a pixel test. You should see two rows with 4
 * canvases in each. The top row of canvases should have a black background,
 * the bottom row should have a dark blue background.  The canvases in the
 * first two rows should have a single triangle. The canvases on the left
 * should have two triangles superimposed on top of each other. If
 * multisampling is supported, the odd columns should have smooth edges instead
 * of jagged stair-stepping.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  var style = new Element.html('''
      <style>
      canvas {
          outline: 1px solid blue;
      }
      body {
          background-color: darkblue;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <script id="2d-fragment-shader" type="x-shader/x-fragment">
      precision mediump float;

      uniform vec4 u_color;

      void main() {
        gl_FragColor = u_color;
      }
      </script>
      <script id="2d-vertex-shader" type="x-shader/x-vertex">
      attribute vec2 a_position;

      uniform vec2 u_resolution;

      void main() {
         // convert the rectangle from pixels to 0.0 to 1.0
         vec2 zeroToOne = a_position / u_resolution;

         // convert from 0->1 to 0->2
         vec2 zeroToTwo = zeroToOne * 2.0;

         // convert from 0->2 to -1->+1 (clipspace)
         vec2 clipSpace = zeroToTwo - 1.0;

         gl_Position = vec4(clipSpace * vec2(1, -1), 0, 1);
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ctxs = [];
  var positionLocation = {};

  setup(gl) {
    // setup a GLSL program
    var vertexShader = wtu.loadShaderFromScript(gl, "2d-vertex-shader");
    var fragmentShader = wtu.loadShaderFromScript(gl, "2d-fragment-shader");
    var program = gl.createProgram();
    gl.attachShader(program, vertexShader);
    gl.attachShader(program, fragmentShader);
    gl.linkProgram(program);
    gl.useProgram(program);

    // look up where the vertex data needs to go.
    positionLocation[gl] = gl.getAttribLocation(program, "a_position");

    // set the resolution
    var resolutionLocation = gl.getUniformLocation(program, "u_resolution");
    gl.uniform2f(resolutionLocation, 100, 100);

    var colorLocation = gl.getUniformLocation(program, "u_color");
    gl.uniform4f(colorLocation, 0, 1, 0, 1);
  }

  for (var i=0; i<8; ++i) {
    var attrs = {
      'alpha': (i >= 4),
      'preserveDrawingBuffer': (i % 4) >= 2,
      'antialias': (i % 2) == 1
    };
    dynamic can = document.createElement('canvas');
    can.width = can.height = 100;
    can.style.position = "absolute";
    can.style.left = "${10 + (i % 4) * 120}px";
    can.style.top = "${i < 4 ? 40 : 150}px";
    document.body.append(can);
    if (i == 3)
      document.body.append(document.createElement('br'));
    ctxs.add(can.getContext("experimental-webgl", attrs));
    setup(ctxs[i]);
  }

  draw(gl, offset) {
    var buffer = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([
          80.0 + offset, 20.0,
          10.0 + offset, 10.0,
          10.0 + offset, 80.0]), wgl.WebGL.STATIC_DRAW);

    gl.enableVertexAttribArray(positionLocation[gl]);
    gl.vertexAttribPointer(positionLocation[gl], 2, wgl.WebGL.FLOAT, false, 0, 0);

    // draw
    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 3);
  }

  drawAll(offset) {
    for (var i=0; i<8; ++i)
      draw(ctxs[i], offset);
  }

  drawAll(0);

  repaintTest() {
    drawAll(50);
    asyncEnd();
  }

  runRepaintTest() {
    setTimeout(repaintTest, 100);
  }

  asyncStart();
  runRepaintTest();
}
