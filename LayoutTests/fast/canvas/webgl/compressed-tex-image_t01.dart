/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures WebGL implementations correctly implement
 * compressedTexImage2D and compressedTexSubImage2D.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  dynamic canvas = document.createElement("canvas");
  var gl = wtu.create3DContext(canvas);

  const COMPRESSED_RGB_S3TC_DXT1_EXT     = 0x83F0;
  const COMPRESSED_RGBA_S3TC_DXT1_EXT    = 0x83F1;
  const COMPRESSED_RGBA_S3TC_DXT5_EXT    = 0x83F3;
  const ETC1_RGB8_OES                    = 0x8D64;
  const COMPRESSED_RGB_PVRTC_4BPPV1_IMG  = 0x8C00;
  const COMPRESSED_RGBA_PVRTC_4BPPV1_IMG = 0x8C02;

  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    var tex = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);

    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.compressedTexImage2D(wgl.WebGL.TEXTURE_2D, 0, COMPRESSED_RGB_S3TC_DXT1_EXT, 4, 4, 0, new Uint8List(8)));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.compressedTexImage2D(wgl.WebGL.TEXTURE_2D, 0, COMPRESSED_RGBA_S3TC_DXT1_EXT, 4, 4, 0, new Uint8List(8)));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.compressedTexImage2D(wgl.WebGL.TEXTURE_2D, 0, COMPRESSED_RGBA_S3TC_DXT5_EXT, 4, 4, 0, new Uint8List(16)));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.compressedTexImage2D(wgl.WebGL.TEXTURE_2D, 0, ETC1_RGB8_OES, 4, 4, 0, new Uint8List(8)));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.compressedTexImage2D(wgl.WebGL.TEXTURE_2D, 0, COMPRESSED_RGB_PVRTC_4BPPV1_IMG, 8, 8, 0, new Uint8List(8)));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.compressedTexImage2D(wgl.WebGL.TEXTURE_2D, 0, COMPRESSED_RGBA_PVRTC_4BPPV1_IMG, 8, 8, 0, new Uint8List(8)));
  }
}
