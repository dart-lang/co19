/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Creates a canvas which is filled red, then attempts to fill a
 * number of 0 size rects, finally fills with green.
 * Fill of a 0-sized rect should not throw an exception, so we expected the
 * output to be a green rect.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="test" width="100" height="100"></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.body.id = "body";

  dynamic canvas = document.getElementById("test");
  var context = canvas.getContext("2d");
  context.fillStyle = '#f00';
  context.fillRect(0, 0, canvas.width, canvas.height);
  try {
    context.fillRect(0, 0, 0, 0);
    context.fillRect(0, 0, canvas.width, 0);
    context.fillRect(0, 0, 0, canvas.height);
  } catch (e) {
    var node = new Text(
        "FAIL -- an exception was thrown when drawing a 0 sized rect");
    document.getElementById("body").append(node);
    return;
  }
  context.fillStyle = '#0f0';
  context.fillRect(0, 0, canvas.width, canvas.height);
  var node = new Text("PASS -- 0 sized rects did not trigger an exception");
  document.getElementById("body").append(node);
}
