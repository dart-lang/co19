/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checks that painting WebGL contents doesn't pollute the
 * context's viewport state.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.appendHtml('<canvas id="webgl-canvas" width="32px" ' +
      'height="32px"></canvas>', treeSanitizer: NodeTreeSanitizer.trusted);

  dynamic canvas;
  var context;

  draw() {
    var viewport = context.getParameter(wgl.WebGL.VIEWPORT);

    debug('Testing viewport');
    shouldBeList(viewport, [20, 20, 10, 10]);
    asyncEnd();
  }

  canvas = document.getElementById("webgl-canvas");
  canvas.width = 50; canvas.height = 50;
  context = create3DContext(canvas);

  context.viewport(20, 20, 10, 10);

  context.clearColor(255, 0, 0, 255);
  context.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

  // We need to ensure that the compositor has run before the drawing
  // takes place. Setting a timeout of zero causes the compositor to run before
  // the draw call. Using requestAnimationFrame caused the test to time-out.
  asyncStart();
  setTimeout(draw, 0);
}
