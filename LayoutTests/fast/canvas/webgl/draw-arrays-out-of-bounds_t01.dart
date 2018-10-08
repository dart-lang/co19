/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test of drawArrays with out-of-bounds parameters
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = create3DContext();
  var program = loadStandardProgram(context);

  context.useProgram(program);
  var vertexObject = context.createBuffer();
  context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  context.enableVertexAttribArray(0);

  debug("Test empty buffer");
  context.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([]), wgl.WebGL.STATIC_DRAW);
  context.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 1));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 10000));
  //shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 10000000000000));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, -1));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.drawArrays(wgl.WebGL.TRIANGLES, 1, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, -1, 0));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.drawArrays(wgl.WebGL.TRIANGLES, 100, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 1, -1));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, -1, 1));

  debug("Test buffer with 3 float vectors");
  context.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([ 0.0,0.5,0.0, -0.5,-0.5,0.0, 0.5,-0.5,0.0 ]), wgl.WebGL.STATIC_DRAW);
  context.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 3));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_ENUM, () => context.drawArrays(0x0009, 0, 3)); // GL_POLYGON
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 3, 2));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 10000));
  //shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 10000000000000));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, -1));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, -1, 0));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.drawArrays(wgl.WebGL.TRIANGLES, 100, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 1, -1));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, -1, 1));

  debug("Test buffer with interleaved (3+2) float vectors");

  var program2 = createProgram(context,
      "attribute vec3 aOne;" +
      "attribute vec2 aTwo;" +
      "void main() { gl_Position = vec4(aOne, 1.0) + vec4(aTwo, 0.0, 1.0); }",
      "void main() { gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0); }",
      [ "aOne", "aTwo" ]);
  if (program2 == null) {
    testFailed("failed to create test program");
  }

  context.useProgram(program2);

  var vbo = context.createBuffer();
  context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vbo);
  // enough for 9 vertices, so 3 triangles
  context.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List(9*5), wgl.WebGL.STATIC_DRAW);

  // bind first 3 elements, with a stride of 5 float elements
  context.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 5*4, 0);
  // bind 2 elements, starting after the first 3; same stride of 5 float elements
  context.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 5*4, 3*4);

  context.enableVertexAttribArray(0);
  context.enableVertexAttribArray(1);

  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 9));

  // negative values must generate INVALID_VALUE; they can never be valid
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, -500));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, -200, 1));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, -200, -500));

  /*
  // 0xffffffff needs to convert to a 'long' IDL argument as -1, as per
  // WebIDL 4.1.7.  JS ToInt32(0xffffffff) == -1, which is the first step
  // of the conversion.  Thus INVALID_VALUE.
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 0xffffffff));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0xffffffff, 1));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0xffffffff, 0xffffffff));

  // values that could otherwise be valid but aren't due to bindings generate
  // INVALID_OPERATION
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 200));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0, 0x7fffffff));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0x7fffffff, 1));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.drawArrays(wgl.WebGL.TRIANGLES, 0x7fffffff, 0x7fffffff));
  */
}
