/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests calling the various uniform[Matrix]* APIs with a null
 * uniform location
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

  var gl = create3DContext();
  var program = loadStandardProgram(gl);

  shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
  shouldBeNull(gl.useProgram(program));


  floatArray(size) {
    var array = new Float32List(size);
    for(var i=0; i<size; ++i)
      array[i] = i.toDouble();
    return array;
  }

  intArray(size) {
    var array = new Int32List(size);
    for(var i=0; i<size; ++i)
      array[i] = i;
    return array;
  }

  int i=0;

  test(func) {
    debug('case #${++i}');
    func();
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
  }

  test(() => gl.uniform1f(null, 0));
  test(() => gl.uniform1fv(null, floatArray(1)));
  test(() => gl.uniform1i(null, 0));
  test(() => gl.uniform1iv(null, intArray(1)));
  test(() => gl.uniform2f(null, 0, 1));
  test(() => gl.uniform2fv(null, floatArray(2)));
  test(() => gl.uniform2i(null, 0, 1));
  test(() => gl.uniform2iv(null, intArray(2)));
  test(() => gl.uniform3f(null, 0, 1, 2));
  test(() => gl.uniform3fv(null, floatArray(3)));
  test(() => gl.uniform3i(null, 0, 1, 2));
  test(() => gl.uniform3iv(null, intArray(3)));
  test(() => gl.uniform4f(null, 0, 1, 2, 3));
  test(() => gl.uniform4fv(null, floatArray(4)));
  test(() => gl.uniform4i(null, 0, 1, 2, 3));
  test(() => gl.uniform4iv(null, intArray(4)));
  test(() => gl.uniformMatrix2fv(null, false, floatArray(4)));
  test(() => gl.uniformMatrix3fv(null, false, floatArray(9)));
  test(() => gl.uniformMatrix4fv(null, false, floatArray(16)));
}
