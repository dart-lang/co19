/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests calling WebGL APIs with wrong argument types
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <div id="description"></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = wtu.create3DContext();
  var program = wtu.loadStandardProgram(context);
  var shader = wtu.loadStandardVertexShader(context);

  assertMsg(program != null, "Program Compiled");
  assertMsg(shader != null, "Shader Compiled");

  var loc = context.getUniformLocation(program, "u_modelViewProjMatrix");
  assertMsg(loc != null, "getUniformLocation succeeded");

  var arguments = [
  { 'value': "foo", 'throw': true },
  { 'value': 0, 'throw': true },
  { 'value': null, 'throw': false }
  ];

  var shouldBeUndefined = shouldBeNull;

  for (var i = 0; i < arguments.length; ++i) {
    var argument = arguments[i]['value'];
    var func, func2, func3;
    var case1=0, case2=0, case3=0;
    var msg = 'testing value ${argument}';
    if (arguments[i]['throw']) {
      func = (x)  { ++case1; debug(msg + ', func case1 $case1'); shouldThrow(x); };
      func2 = (x) { ++case2; debug(msg + ', func2 case2 $case2'); shouldThrow(x); };
      func3 = (x) { ++case3; debug(msg + ', func3 case3 $case3'); shouldThrow(x); };
    } else {
      func = (x)  { ++case1; debug(msg + ', func case1 $case1'); shouldBeUndefined(x()); };
      func2 = (x) { ++case2; debug(msg + ', func2 case2 $case2'); shouldBeNull(x()); };
      func3 = (x) { ++case3; debug(msg + ', func3 case3 $case3'); shouldBeNull(x()); };
    }
    func(() => context.compileShader(argument));
    func(() => context.linkProgram(argument));
    func(() => context.attachShader(program, argument));
    func(() => context.attachShader(argument, shader));
    func(() => context.detachShader(program, argument));
    func(() => context.detachShader(argument, shader));
    func(() => context.useProgram(argument));
    func(() => context.shaderSource(argument, 'foo'));
    func(() => context.bindAttribLocation(argument, 0, 'foo'));
    func(() => context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, argument));
    func(() => context.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, argument));
    func(() => context.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, argument));
    func(() => context.bindTexture(wgl.WebGL.TEXTURE_2D, argument));
    func(() => context.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_ATTACHMENT, wgl.WebGL.RENDERBUFFER, argument));
    func(() => context.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, argument, 0));
    func(() => context.uniform2fv(argument, new Float32List.fromList([0.0, 0.0])));
    func(() => context.uniform2iv(argument, new Int32List.fromList([0, 0])));
    func(() => context.uniformMatrix2fv(argument, false, new Float32List.fromList([0.0, 0.0, 0.0, 0.0])));

    func2(() => context.getProgramParameter(argument, 0));
    func2(() => context.getShaderParameter(argument, 0));
    func2(() => context.getUniform(argument, loc));
    func2(() => context.getUniform(program, argument));
    func2(() => context.getUniformLocation(argument, 'u_modelViewProjMatrix'));

    func3(() => context.getProgramInfoLog(argument));
    func3(() => context.getShaderInfoLog(argument));
    func3(() => context.getShaderSource(argument));
  }
}
