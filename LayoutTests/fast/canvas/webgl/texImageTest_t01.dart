/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test of texImage2d and texSubImage2d
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
  var image = document.createElement("img");
  var video = document.createElement("video");
  dynamic canvas2d = document.createElement("canvas");
  var context2d = canvas2d.getContext("2d");
  var imageData = context2d.createImageData(64, 64);
  var array = new Uint8List.fromList([ 0, 0, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 255 ]);

  shouldThrow(() => context.texImage2D(wgl.WebGL.TEXTURE_2D));
  shouldBeNull(context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 64, 64, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null));
  shouldThrow(() => context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 0));
  shouldBeNull(context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 2, 2, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, array));
  shouldBeNull(context.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 1));
  shouldBeNull(context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, imageData));
  shouldBeNull(context.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 0));
  shouldBeNull(context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, image));
  shouldBeNull(context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas2d));
  shouldBeNull(context.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 1));
  shouldBeNull(context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, video));

  shouldThrow(() => context.texSubImage2D(wgl.WebGL.TEXTURE_2D));
  shouldBeNull(context.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 10, 20, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null));
  shouldThrow(() => context.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 10, 20, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 0));
  shouldThrow(() => context.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 10, 20, 0, wgl.WebGL.UNSIGNED_BYTE, 0));
  shouldBeNull(context.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 0));
  shouldBeNull(context.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 10, 20, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, imageData));
  shouldBeNull(context.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 10, 20, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, image));
  shouldBeNull(context.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 1));
  shouldBeNull(context.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 10, 20, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas2d));
  shouldBeNull(context.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 0));
  shouldBeNull(context.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 1));
  shouldBeNull(context.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 10, 20, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, video));
}
