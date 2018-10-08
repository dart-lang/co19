/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks to see if the browser survives the attempted
 * creation of an excessively large canvas.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="bigCanvas" width="134217728" height="1"></canvas>
      <p>This test checks to see if the browser survives the attempted creation
      of an excessively large canvas.</p>
      <hr>
      <p><ol id=console></ol></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    dynamic canvas = document.getElementById("bigCanvas");
    var width = canvas.width;
    // We need to perform a context fetch to force allocation of
    // canvas resources.
    if (canvas.getContext("2d") != null) {
      var ctx = canvas.getContext("2d");
      shouldBeNonNull(ctx);
    }

    debug("Survived canvas creation attempt. Width = $width");
  }

  test();
}
