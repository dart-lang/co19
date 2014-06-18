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
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  var context = create3DContext(document.getElementById("canvas"));
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
    shouldBe(context.getParameter(wgl.ACTIVE_TEXTURE), wgl.TEXTURE0);
    shouldBe((context.getParameter(wgl.ALIASED_LINE_WIDTH_RANGE)[0] == 1) || (context.getParameter(wgl.ALIASED_LINE_WIDTH_RANGE)[1] == 1), true);
    shouldBe((context.getParameter(wgl.ALIASED_POINT_SIZE_RANGE)[0] == 1) || (context.getParameter(wgl.ALIASED_POINT_SIZE_RANGE)[1] == 1), true);
    shouldBe(context.getParameter(wgl.ARRAY_BUFFER_BINDING), null);
    shouldBe(context.getParameter(wgl.BLEND), false);
    shouldBeList(context.getParameter(wgl.BLEND_COLOR), [0, 0, 0, 0]);
    shouldBe(context.getParameter(wgl.BLEND_DST_ALPHA), 0);
    shouldBe(context.getParameter(wgl.BLEND_DST_RGB), 0);
    shouldBe(context.getParameter(wgl.BLEND_EQUATION_ALPHA), wgl.FUNC_ADD);
    shouldBe(context.getParameter(wgl.BLEND_EQUATION_RGB), wgl.FUNC_ADD);
    shouldBe(context.getParameter(wgl.BLEND_SRC_ALPHA), 1);
    shouldBe(context.getParameter(wgl.BLEND_SRC_RGB), 1);
    shouldBeList(context.getParameter(wgl.COLOR_CLEAR_VALUE), [0, 0, 0, 0]);
    shouldBeList(context.getParameter(wgl.COLOR_WRITEMASK), [true, true, true, true]);
    shouldBe(context.getParameter(wgl.CULL_FACE), false);
    shouldBe(context.getParameter(wgl.CULL_FACE_MODE), wgl.BACK);
    shouldBe(context.getParameter(wgl.CURRENT_PROGRAM), null);
    shouldBe(context.getParameter(wgl.DEPTH_CLEAR_VALUE), 1);
    shouldBe(context.getParameter(wgl.DEPTH_FUNC), wgl.LESS);
    shouldBeList(context.getParameter(wgl.DEPTH_RANGE), [0, 1]);
    shouldBe(context.getParameter(wgl.DEPTH_TEST), false);
    shouldBe(context.getParameter(wgl.DEPTH_WRITEMASK), true);
    shouldBe(context.getParameter(wgl.DITHER), true);
    shouldBe(context.getParameter(wgl.ELEMENT_ARRAY_BUFFER_BINDING), null);
    shouldBe(context.getParameter(wgl.FRONT_FACE), wgl.CCW);
    shouldBe(context.getParameter(wgl.GENERATE_MIPMAP_HINT), wgl.DONT_CARE);
    shouldBe(context.getParameter(wgl.LINE_WIDTH), 1);
    shouldBe(context.getParameter(wgl.POLYGON_OFFSET_FACTOR), 0);
    shouldBe(context.getParameter(wgl.POLYGON_OFFSET_FILL), false);
    shouldBe(context.getParameter(wgl.POLYGON_OFFSET_UNITS), 0);
    shouldBe(context.getParameter(wgl.RENDERBUFFER_BINDING), null);
    shouldBe(context.getParameter(wgl.SAMPLE_COVERAGE_INVERT), false);
    shouldBe(context.getParameter(wgl.SAMPLE_COVERAGE_VALUE), 1);
    shouldBe(context.getParameter(wgl.SCISSOR_BOX)[0], 0);
    shouldBe(context.getParameter(wgl.SCISSOR_BOX)[1], 0);
    shouldBe(context.getParameter(wgl.SCISSOR_TEST), false);
    shouldBe(context.getParameter(wgl.STENCIL_BACK_FAIL), wgl.KEEP);
    shouldBe(context.getParameter(wgl.STENCIL_BACK_FUNC), wgl.ALWAYS);
    shouldBe(context.getParameter(wgl.STENCIL_BACK_PASS_DEPTH_FAIL), wgl.KEEP);
    shouldBe(context.getParameter(wgl.STENCIL_BACK_PASS_DEPTH_PASS), wgl.KEEP);
    shouldBe(context.getParameter(wgl.STENCIL_BACK_REF), 0);

    shouldBe(context.getParameter(wgl.STENCIL_BACK_VALUE_MASK), 0xFFFFFFFF);
    shouldBe(context.getParameter(wgl.STENCIL_BACK_WRITEMASK), 0xFFFFFFFF);

    // If EXT_packed_depth_stencil is supported, STENCIL_BITS > 0; otherwise, STENCIL_BITS == 0.
    shouldBe(context.getParameter(wgl.STENCIL_BITS) >= 0, true);
    shouldBe(context.getParameter(wgl.STENCIL_CLEAR_VALUE), 0);
    shouldBe(context.getParameter(wgl.STENCIL_FAIL), wgl.KEEP);
    shouldBe(context.getParameter(wgl.STENCIL_FUNC), wgl.ALWAYS);
    shouldBe(context.getParameter(wgl.STENCIL_PASS_DEPTH_FAIL), wgl.KEEP);
    shouldBe(context.getParameter(wgl.STENCIL_PASS_DEPTH_PASS), wgl.KEEP);
    shouldBe(context.getParameter(wgl.STENCIL_REF), 0);
    shouldBe(context.getParameter(wgl.STENCIL_TEST), false);

    shouldBe(context.getParameter(wgl.STENCIL_VALUE_MASK), 0xFFFFFFFF);
    shouldBe(context.getParameter(wgl.STENCIL_WRITEMASK), 0xFFFFFFFF);

    shouldBe(context.getParameter(wgl.TEXTURE_BINDING_2D), null);
    shouldBe(context.getParameter(wgl.TEXTURE_BINDING_CUBE_MAP), null);
    shouldBe(context.getParameter(wgl.UNPACK_ALIGNMENT), 4);
    shouldBe(context.getParameter(wgl.UNPACK_FLIP_Y_WEBGL), false);
    shouldBe(context.getParameter(wgl.UNPACK_PREMULTIPLY_ALPHA_WEBGL), false);
    shouldBeList(context.getParameter(wgl.VIEWPORT), [0, 0, 2, 2]);
    shouldBeTrue(context.getParameter(wgl.MAX_FRAGMENT_UNIFORM_VECTORS) >= 16);
    shouldBeTrue(context.getParameter(wgl.MAX_VERTEX_UNIFORM_VECTORS) >= 128);
    shouldBeTrue(context.getParameter(wgl.MAX_VARYING_VECTORS) >= 8);
    shouldBeList(context.getParameter(wgl.COMPRESSED_TEXTURE_FORMATS), []);
  }
}
