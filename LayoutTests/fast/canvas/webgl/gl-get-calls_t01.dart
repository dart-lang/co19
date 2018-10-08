/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures basic functionality of the underlying
 * graphics library
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  dynamic context = create3DContext(document.getElementById("canvas"));
  if (context == null)
    testFailed("context does not exist");
  else {
    testPassed("context exists");

    debug("Context is correct type");
    if (context is CanvasRenderingContext)
      testPassed("context is correct type");
    else
      testFailed("context is not correct type");

    debug("Context contains getError");
    if (context.getError != null)
      testPassed("context contains getError");
    else
      testFailed("context does not contains getError");

    debug("Check default values");
    shouldBe(context.getParameter(wgl.WebGL.ACTIVE_TEXTURE), wgl.WebGL.TEXTURE0);
    shouldBe((context.getParameter(wgl.WebGL.ALIASED_LINE_WIDTH_RANGE)[0] == 1) || (context.getParameter(wgl.WebGL.ALIASED_LINE_WIDTH_RANGE)[1] == 1), true);
    shouldBe((context.getParameter(wgl.WebGL.ALIASED_POINT_SIZE_RANGE)[0] == 1) || (context.getParameter(wgl.WebGL.ALIASED_POINT_SIZE_RANGE)[1] == 1), true);
    shouldBe(context.getParameter(wgl.WebGL.ARRAY_BUFFER_BINDING), null);
    shouldBe(context.getParameter(wgl.WebGL.BLEND), false);
    shouldBeList(context.getParameter(wgl.WebGL.BLEND_COLOR), [0, 0, 0, 0]);
    shouldBe(context.getParameter(wgl.WebGL.BLEND_DST_ALPHA), 0);
    shouldBe(context.getParameter(wgl.WebGL.BLEND_DST_RGB), 0);
    shouldBe(context.getParameter(wgl.WebGL.BLEND_EQUATION_ALPHA), wgl.WebGL.FUNC_ADD);
    shouldBe(context.getParameter(wgl.WebGL.BLEND_EQUATION_RGB), wgl.WebGL.FUNC_ADD);
    shouldBe(context.getParameter(wgl.WebGL.BLEND_SRC_ALPHA), 1);
    shouldBe(context.getParameter(wgl.WebGL.BLEND_SRC_RGB), 1);
    shouldBeList(context.getParameter(wgl.WebGL.COLOR_CLEAR_VALUE), [0, 0, 0, 0]);
    shouldBeList(context.getParameter(wgl.WebGL.COLOR_WRITEMASK), [true, true, true, true]);
    shouldBe(context.getParameter(wgl.WebGL.CULL_FACE), false);
    shouldBe(context.getParameter(wgl.WebGL.CULL_FACE_MODE), wgl.WebGL.BACK);
    shouldBe(context.getParameter(wgl.WebGL.CURRENT_PROGRAM), null);
    shouldBe(context.getParameter(wgl.WebGL.DEPTH_CLEAR_VALUE), 1);
    shouldBe(context.getParameter(wgl.WebGL.DEPTH_FUNC), wgl.WebGL.LESS);
    shouldBeList(context.getParameter(wgl.WebGL.DEPTH_RANGE), [0, 1]);
    shouldBe(context.getParameter(wgl.WebGL.DEPTH_TEST), false);
    shouldBe(context.getParameter(wgl.WebGL.DEPTH_WRITEMASK), true);
    shouldBe(context.getParameter(wgl.WebGL.DITHER), true);
    shouldBe(context.getParameter(wgl.WebGL.ELEMENT_ARRAY_BUFFER_BINDING), null);
    shouldBe(context.getParameter(wgl.WebGL.FRONT_FACE), wgl.WebGL.CCW);
    shouldBe(context.getParameter(wgl.WebGL.GENERATE_MIPMAP_HINT), wgl.WebGL.DONT_CARE);
    shouldBe(context.getParameter(wgl.WebGL.LINE_WIDTH), 1);
    shouldBe(context.getParameter(wgl.WebGL.POLYGON_OFFSET_FACTOR), 0);
    shouldBe(context.getParameter(wgl.WebGL.POLYGON_OFFSET_FILL), false);
    shouldBe(context.getParameter(wgl.WebGL.POLYGON_OFFSET_UNITS), 0);
    shouldBe(context.getParameter(wgl.WebGL.RENDERBUFFER_BINDING), null);
    shouldBe(context.getParameter(wgl.WebGL.SAMPLE_COVERAGE_INVERT), false);
    shouldBe(context.getParameter(wgl.WebGL.SAMPLE_COVERAGE_VALUE), 1);
    shouldBe(context.getParameter(wgl.WebGL.SCISSOR_BOX)[0], 0);
    shouldBe(context.getParameter(wgl.WebGL.SCISSOR_BOX)[1], 0);
    shouldBe(context.getParameter(wgl.WebGL.SCISSOR_TEST), false);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BACK_FAIL), wgl.WebGL.KEEP);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BACK_FUNC), wgl.WebGL.ALWAYS);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BACK_PASS_DEPTH_FAIL), wgl.WebGL.KEEP);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BACK_PASS_DEPTH_PASS), wgl.WebGL.KEEP);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BACK_REF), 0);

    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BACK_VALUE_MASK), 0xFFFFFFFF);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BACK_WRITEMASK), 0xFFFFFFFF);

    // If EXT_packed_depth_stencil is supported, STENCIL_BITS > 0; otherwise, STENCIL_BITS == 0.
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_BITS) >= 0, true);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_CLEAR_VALUE), 0);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_FAIL), wgl.WebGL.KEEP);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_FUNC), wgl.WebGL.ALWAYS);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_PASS_DEPTH_FAIL), wgl.WebGL.KEEP);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_PASS_DEPTH_PASS), wgl.WebGL.KEEP);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_REF), 0);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_TEST), false);

    shouldBe(context.getParameter(wgl.WebGL.STENCIL_VALUE_MASK), 0xFFFFFFFF);
    shouldBe(context.getParameter(wgl.WebGL.STENCIL_WRITEMASK), 0xFFFFFFFF);

    shouldBe(context.getParameter(wgl.WebGL.TEXTURE_BINDING_2D), null);
    shouldBe(context.getParameter(wgl.WebGL.TEXTURE_BINDING_CUBE_MAP), null);
    shouldBe(context.getParameter(wgl.WebGL.UNPACK_ALIGNMENT), 4);
    shouldBe(context.getParameter(wgl.WebGL.UNPACK_FLIP_Y_WEBGL), false);
    shouldBe(context.getParameter(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL), false);
    shouldBeList(context.getParameter(wgl.WebGL.VIEWPORT), [0, 0, 2, 2]);
    shouldBeTrue(context.getParameter(wgl.WebGL.MAX_FRAGMENT_UNIFORM_VECTORS) >= 16);
    shouldBeTrue(context.getParameter(wgl.WebGL.MAX_VERTEX_UNIFORM_VECTORS) >= 128);
    shouldBeTrue(context.getParameter(wgl.WebGL.MAX_VARYING_VECTORS) >= 8);
    shouldBeList(context.getParameter(wgl.WebGL.COMPRESSED_TEXTURE_FORMATS), []);
  }
}
