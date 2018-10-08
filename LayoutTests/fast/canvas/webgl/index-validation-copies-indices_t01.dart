/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that client data is always copied during bufferData and
 * bufferSubData calls, because otherwise the data the GL uses to draw may
 * differ from that checked by the index validation code.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = create3DContext();
  var program = loadStandardProgram(context);

  context.useProgram(program);
  var vertexObject = context.createBuffer();
  context.enableVertexAttribArray(0);
  context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  // 4 vertices -> 2 triangles
  context.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([ 0.0,0.0,0.0,
        0.0,1.0,0.0, 1.0,0.0,0.0, 1.0,1.0,0.0 ]), wgl.WebGL.STATIC_DRAW);
  context.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

  var indexObject = context.createBuffer();

  context.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indexObject);
  var indices = new Uint16List.fromList([ 10000, 0, 1, 2, 3, 10000 ]);
  context.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR,
      () => context.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_SHORT, 2));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION,
      () => context.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_SHORT, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION,
      () => context.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_SHORT, 4));
  indices[0] = 2;
  indices[5] = 1;
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR,
      () => context.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_SHORT, 2));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION,
      () => context.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_SHORT, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION,
      () => context.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_SHORT, 4));
}
