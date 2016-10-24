/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test of drawElements with out-of-bounds parameters
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
  context.enableVertexAttribArray(0);
  context.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
  context.bufferData(wgl.ARRAY_BUFFER, new Float32List.fromList([ 0.0,0.5,0.0, -0.5,-0.5,0.0, 0.5,-0.5,0.0 ]), wgl.STATIC_DRAW);
  context.vertexAttribPointer(0, 3, wgl.FLOAT, false, 0, 0);

  var indexObject = context.createBuffer();

  debug("Test empty index buffer");
  context.bindBuffer(wgl.ELEMENT_ARRAY_BUFFER, indexObject);
  context.bufferData(wgl.ELEMENT_ARRAY_BUFFER, new Uint8List.fromList([]), wgl.STATIC_DRAW);
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 10000, wgl.UNSIGNED_BYTE, 0));
  //shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 10000000000000, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, -1, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 1, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, 0, wgl.UNSIGNED_BYTE, -1));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 0, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, -1, wgl.UNSIGNED_BYTE, 1));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, 1, wgl.UNSIGNED_BYTE, -1));

  debug("Test buffer with 3 byte indexes");
  context.bindBuffer(wgl.ELEMENT_ARRAY_BUFFER, indexObject);
  context.bufferData(wgl.ELEMENT_ARRAY_BUFFER, new Uint8List.fromList([ 0, 1, 2 ]), wgl.STATIC_DRAW);
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_INT, 0));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.drawElements(0x0009, 3, wgl.UNSIGNED_BYTE, 0)); // GL_POLYGON
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_BYTE, 2));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 10000, wgl.UNSIGNED_BYTE, 0));
  //shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 10000000000000, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, -1, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, 0, wgl.UNSIGNED_BYTE, -1));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, -1, wgl.UNSIGNED_BYTE, 1));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, 1, wgl.UNSIGNED_BYTE, -1));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 0, wgl.UNSIGNED_BYTE, 4));
  //shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, 0xffffffff, wgl.UNSIGNED_BYTE, 0));
  //shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 0x7fffffff, wgl.UNSIGNED_BYTE, 0));
  //shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 0x7fffffff, wgl.UNSIGNED_BYTE, 0x7fffffff));

  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bufferData(wgl.ELEMENT_ARRAY_BUFFER, (new Uint8List.fromList([ 3, 0, 1, 2 ])).sublist(1), wgl.STATIC_DRAW));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bufferSubData(wgl.ELEMENT_ARRAY_BUFFER, 0, new Uint8List.fromList([ 3, 0, 1])));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bufferSubData(wgl.ELEMENT_ARRAY_BUFFER, 0, (new Uint8List.fromList([ 3, 0, 1, 2 ])).sublist(1)));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_BYTE, 0));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 0, wgl.UNSIGNED_BYTE, 0));

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
  context.bindBuffer(wgl.ARRAY_BUFFER, vbo);
  // enough for 9 vertices, so 3 triangles
  context.bufferData(wgl.ARRAY_BUFFER, new Float32List(9*5), wgl.STATIC_DRAW);

  // bind first 3 elements, with a stride of 5 float elements
  context.vertexAttribPointer(0, 3, wgl.FLOAT, false, 5*4, 0);
  // bind 2 elements, starting after the first 3; same stride of 5 float elements
  context.vertexAttribPointer(1, 2, wgl.FLOAT, false, 5*4, 3*4);

  context.enableVertexAttribArray(0);
  context.enableVertexAttribArray(1);

  var ebo = context.createBuffer();
  context.bindBuffer(wgl.ELEMENT_ARRAY_BUFFER, ebo);
  context.bufferData(wgl.ELEMENT_ARRAY_BUFFER, new Uint16List.fromList([ 0, 1, 2,
        1, 2, 0,
        2, 0, 1,
        200, 200, 200,
        0x7fff, 0x7fff, 0x7fff,
        0xffff, 0xffff, 0xffff ]),
      wgl.STATIC_DRAW);

  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 9, wgl.UNSIGNED_SHORT, 0));

  // invalid type arguments
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.drawElements(wgl.TRIANGLES, 9, wgl.FLOAT, 0));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.drawElements(wgl.TRIANGLES, 9, wgl.SHORT, 0));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.drawElements(wgl.TRIANGLES, 9, wgl.UNSIGNED_INT, 0));

  // invalid operation with indices that would be valid with correct bindings
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 9, wgl.UNSIGNED_SHORT, 1000));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 12, wgl.UNSIGNED_SHORT, 0));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 15, wgl.UNSIGNED_SHORT, 0));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 18, wgl.UNSIGNED_SHORT, 0));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 3, wgl.UNSIGNED_SHORT, 2*15));

  //shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.drawElements(wgl.TRIANGLES, 0xffffffff, wgl.UNSIGNED_SHORT, 0));
  //shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 0x7fffffff, wgl.UNSIGNED_SHORT, 0));

  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 0, wgl.UNSIGNED_SHORT, 0));

  // invalid operation with offset that's not a multiple of the type size
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 6, wgl.UNSIGNED_SHORT, 0));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 6, wgl.UNSIGNED_SHORT, 1));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.drawElements(wgl.TRIANGLES, 6, wgl.UNSIGNED_SHORT, 2));

  // invalid operation if no buffer is bound to ELEMENT_ARRAY_BUFFER
  context.bindBuffer(wgl.ELEMENT_ARRAY_BUFFER, null);
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.drawElements(wgl.TRIANGLES, 6, wgl.UNSIGNED_SHORT, 0));
}
