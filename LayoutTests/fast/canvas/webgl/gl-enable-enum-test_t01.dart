/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures WebGL implementations allow OpenGL ES 2.0
 * features to be turned on but not non OpenGL ES 2.0 features.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/desktop-gl-constants.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  dynamic gl = create3DContext(document.getElementById("canvas"));
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    debug("Checking wgl.WebGL.ENABLE enums.");

    var invalidEnums = [
      'ALPHA_TEST',
      'AUTO_NORMAL',
      'CLIP_PLANE0',
      'CLIP_PLANE1',
      'COLOR_LOGIC_OP',
      'COLOR_MATERIAL',
      'COLOR_SUM',
      'COLOR_TABLE',
      //   'CONVOLUTION_1D',
      //   'CONVOLUTION_2D',
      'FOG',
      'HISTOGRAM',
      'INDEX_LOGIC_OP',
      'LIGHT0',
      'LIGHT1',
      'LIGHTING',
      'LINE_SMOOTH',
      'LINE_STIPPLE',
      'MAP1_COLOR_4',
      'MAP1_INDEX',
      'MAP1_NORMAL',
      'MAP1_TEXTURE_COORD_1',
      'MAP1_TEXTURE_COORD_2',
      'MAP1_TEXTURE_COORD_3',
      'MAP1_TEXTURE_COORD_4',
      'MAP1_VERTEX_3',
      'MAP1_VERTEX_4',
      'MAP2_COLOR_4',
      'MAP2_INDEX',
      'MAP2_NORMAL',
      'MAP2_TEXTURE_COORD_1',
      'MAP2_TEXTURE_COORD_2',
      'MAP2_TEXTURE_COORD_3',
      'MAP2_TEXTURE_COORD_4',
      'MAP2_VERTEX_3',
      'MAP2_VERTEX_4',
      'MINMAX',
      'MULTISAMPLE',
      'NORMALIZE',
      'POINT_SMOOTH',
      'POINT_SPRITE',
      'POLYGON_OFFSET_LINE',
      'POLYGON_OFFSET_POINT',
      'POLYGON_SMOOTH',
      'POLYGON_STIPPLE',
      'POST_COLOR_MATRIX_COLOR_TABLE',
      'POST_CONVOLUTION_COLOR_TABLE',
      'RESCALE_NORMAL',
      'SAMPLE_ALPHA_TO_ONE',
      //   'SEPARABLE_2D',
      'TEXTURE_1D',
      'TEXTURE_2D',
      'TEXTURE_3D',
      'TEXTURE_CUBE_MAP',
      'TEXTURE_GEN_Q',
      'TEXTURE_GEN_R',
      'TEXTURE_GEN_S',
      'TEXTURE_GEN_T',
      'VERTEX_PROGRAM_POINT_SIZE',
      'VERTEX_PROGRAM_TWO_SIDE'
    ];

    for (var ii = 0; ii < invalidEnums.length; ++ii) {
      var name = invalidEnums[ii];
      debug("Invalid enums, $name");
      var value = desktopGL[name];
      if (value != null) {
        gl.enable(desktopGL[name]);
        assertMsg(gl.getError() == wgl.WebGL.INVALID_ENUM,
            "gl.enable must set INVALID_ENUM when passed GL_$name");
      }
    }

    var validEnums = [
      wgl.WebGL.BLEND,
      wgl.WebGL.CULL_FACE,
      wgl.WebGL.DEPTH_TEST,
      wgl.WebGL.DITHER,
      wgl.WebGL.POLYGON_OFFSET_FILL,
      wgl.WebGL.SAMPLE_ALPHA_TO_COVERAGE,
      wgl.WebGL.SAMPLE_COVERAGE,
      wgl.WebGL.SCISSOR_TEST,
      wgl.WebGL.STENCIL_TEST
    ];

    for (var ii = 0; ii < validEnums.length; ++ii) {
      var name = validEnums[ii];
      debug("Valid enums, case $ii");
      gl.enable(name);
      assertMsg(gl.getError() == wgl.WebGL.NO_ERROR,
          "gl.enable must succeed when passed $name");
    }
  }
}
