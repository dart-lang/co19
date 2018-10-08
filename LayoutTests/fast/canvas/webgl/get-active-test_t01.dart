/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test of getActiveAttrib and getActiveUniform
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = create3DContext();
  var context2 = create3DContext();
  var program = loadStandardProgram(context);
  var program2 = loadProgram(context2,
      "$root/resources/intArrayUniformShader.vert",
      "$root/resources/noopUniformShader.frag");

  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);
  shouldBe(context.getActiveUniform(program, 0).name, 'u_modelViewProjMatrix');
  shouldBe(context.getActiveUniform(program, 0).type, wgl.WebGL.FLOAT_MAT4);
  shouldBe(context.getActiveUniform(program, 0).size, 1);
  shouldBeNull(context.getActiveUniform(program, 1));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  //shouldBeNull(context.getActiveUniform(program, -1));
  //glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  shouldBeNull(context.getActiveUniform(null, 0));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);

  // we don't know the order the attribs will appear.
  var info = [
    context.getActiveAttrib(program, 0),
    context.getActiveAttrib(program, 1)
  ];
  for (var ii = 0; ii < info.length; ++ii)
    shouldBeNonNull(info[ii]);

  var expected = [
  { 'name': 'a_normal', 'type': wgl.WebGL.FLOAT_VEC3, 'size': 1 },
  { 'name': 'a_vertex', 'type': wgl.WebGL.FLOAT_VEC4, 'size': 1 }
  ];

  var t;
  if (info[0].name != expected[0]['name']) {
    t = info[0];
    info[0] = info[1];
    info[1] = t;
  }

  for (var ii = 0; ii < info.length; ++ii) {
    shouldBe(info[ii].name, expected[ii]['name']);
    shouldBe(info[ii].type, expected[ii]['type']);
    shouldBe(info[ii].size, expected[ii]['size']);
  }

  // we don't know the order the uniforms will appear.
  var info2 = [
    context2.getActiveUniform(program2, 0),
    context2.getActiveUniform(program2, 1)
  ];
  for (var ii = 0; ii < info2.length; ++ii)
    shouldBeNonNull(info2[ii]);

  var expected2 = [
  { 'name': 'ival', 'type': wgl.WebGL.INT, 'size': 1 },
  { 'name': 'ival2[0]', 'type': wgl.WebGL.INT, 'size': 2 }
  ];

  if (info2[0].name != expected2[0]['name']) {
    t = info2[0];
    info2[0] = info2[1];
    info2[1] = t;
  }

  for (var ii = 0; ii < info2.length; ++ii) {
    shouldBe(info2[ii].name, expected2[ii]['name']);
    shouldBe(info2[ii].type, expected2[ii]['type']);
    shouldBe(info2[ii].size, expected2[ii]['size']);
  }

  shouldBeNull(context.getActiveAttrib(program, 2));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  //shouldBeNull(context.getActiveAttrib(program, -1));
  //glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  shouldBeNull(context.getActiveAttrib(null, 0));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);

  glErrorShouldBe(context2, wgl.WebGL.NO_ERROR);

  debug("Check trying to get attribs from different context");
  shouldBeNull(context2.getActiveAttrib(program, 0));
  glErrorShouldBe(context2, wgl.WebGL.INVALID_OPERATION);
  shouldBeNull(context2.getActiveUniform(program, 0));
  glErrorShouldBe(context2, wgl.WebGL.INVALID_OPERATION);

  debug("Check trying to get attribs from deleted program");
  context.deleteProgram(program);
  shouldBeNull(context.getActiveUniform(program, 0));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  shouldBeNull(context.getActiveAttrib(program, 0));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
}
