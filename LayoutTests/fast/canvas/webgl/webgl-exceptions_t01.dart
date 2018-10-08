/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  var gl = create3DContext();
  shouldThrow(() => gl.getBufferParameter());
  shouldThrow(() => gl.getRenderbufferParameter());
  shouldThrow(() => gl.getTexParameter());
  shouldThrow(() => gl.getVertexAttrib());
  shouldThrow(() => gl.getAttachedShaders());
  shouldThrow(() => gl.getExtension());
  shouldThrow(() => gl.getFramebufferAttachmentParameter());
  shouldThrow(() => gl.getParameter());
  shouldThrow(() => gl.getProgramParameter());
  shouldThrow(() => gl.getShaderParameter());
  shouldThrow(() => gl.getUniform());
  shouldThrow(() => gl.uniform1iv());
  shouldThrow(() => gl.uniformMatrix2fv());
  shouldThrow(() => gl.uniform1fv());
  shouldThrow(() => gl.vertexAttrib1fv());
  shouldThrow(() => gl.uniformMatrix4fv(1, 1));
}
