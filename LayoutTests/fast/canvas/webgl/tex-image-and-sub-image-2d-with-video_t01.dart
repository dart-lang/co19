/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify texImage2D and texSubImage2D code paths taking video
 * elements
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/tex-image-and-sub-image-2d-with-video.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="32px" height="32px"></canvas>
      <div id="console"></div>
      <video width="640" height="228" id="vid" controls>
        <source src="$root/resources/red-green.mp4"  type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"' />
        <source src="$root/resources/red-green.webmvp8.webm" type='video/webm; codecs="vp8, vorbis"' />
        <source src="$root/resources/red-green.theora.ogv"  type='video/ogg; codecs="theora, vorbis"' />
      </video>
      ''', treeSanitizer: new NullTreeSanitizer());

  testPrologue(gl) {
    return true;
  }

  asyncStart();

  window.onLoad.listen((_) {
    generateTest(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, testPrologue)();
    asyncEnd();
  });
}
