/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          Test that specifying <tt>display: none</tt> for a <tt>legend</tt> element works.
      </p>
      <p id="result">
      </p>
      <fieldset>
          <legend id="target" style="display: none;">Legendary</legend>
      </fieldset>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  var display = getComputedStyle(document.getElementById("target")).display;
  shouldBe(display, "none");
}
