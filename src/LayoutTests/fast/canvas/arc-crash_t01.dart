/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests that we don't crash when passing inf as a parameter
 * to arc
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="test" width="100" height="100"></canvas><br />
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas = document.getElementById("test");
  var context = canvas.getContext("2d");
  context.fillStyle = '#f00';
  context.fillRect(0, 0, canvas.width, canvas.height);
  //try {
    context.arc(10, 10, 20, 20, 1.0/0.0, true);
    context.arc(10, 10, 20, 20, 1.0/0.0, true);
    context.arc(10, 10, 1.0/0.0, 20, 20, true);
    context.arc(10, 10, 20, 1.0/0.0, 20, true);
    context.arc(10, 1.0/0.0, 10, 20, 20, true);
    context.arc(1.0/0.0, 10, 10, 20, 20, true);
    context.arc(10, 10, 20, 20, 1.0/0.0, false);
    context.arc(10, 10, 1.0/0.0, 20, 20, false);
    context.arc(10, 10, 20, 1.0/0.0, 20, false);
    context.arc(10, 1.0/0.0, 10, 20, 20, false);
    context.arc(1.0/0.0, 10, 10, 20, 20, false);
  //} catch (e) {
  //}
  context.fillStyle = '#0f0';
  context.fillRect(0, 0, canvas.width, canvas.height);
  debug("Test passed.");
}
