/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checks that painting WebGL contents doesn't pollute the context
 * state.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body
    .appendHtml('<canvas id="webgl-canvas" width="32px" height="32px"></canvas>',
      treeSanitizer: NodeTreeSanitizer.trusted);

  dynamic canvas;
  var context;

  draw() {
    // Draw a blue quad to the screen.  The compositor should have executed
    // before reaching this point.  If the texture state was corrupted, then
    // a red quad will be drawn.  See crbug.com/105045.
    wtu.drawQuad(context);

    wtu.checkCanvasRect(context, 0, 0, 1, 1, [0, 0, 255, 255],
        "Should have rendered blue.", 1);
    asyncEnd();
  }

  canvas = document.getElementById("webgl-canvas");
  context = create3DContext(canvas);

  var program = wtu.setupTexturedQuad(context);
  var texture = wtu.createColoredTexture(context, 1, 1, [0, 0, 255, 255]);

  context.uniform1i(context.getUniformLocation(program, "tex"), 0);

  context.activeTexture(wgl.WebGL.TEXTURE0 + 5);
  context.bindTexture(wgl.WebGL.TEXTURE_2D, texture);

  context.viewport(0, 0, canvas.width, canvas.height);

  context.clearColor(255, 0, 0, 255);
  context.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

  // We need to ensure that the compositor has run before the drawing
  // takes place.  requestAnimationFrame was tried for this purpose,
  // but it did not produce the failing behaviour in crbug.com/105045.
  // A timeout of 100 ms was found to consistently reproduce the problem.
  asyncStart();
  setTimeout(draw, 100);
}
