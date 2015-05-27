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
import "../../../Utils/async_utils.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.body.setInnerHtml('''
      <div style="background-position: 25% 75%">
          <div id="target" style="background-position: inherit;"></div>
      </div>
      <p>
          This tests that <tt>background-position: inherit</tt> is applied correctly.
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var targetBackgroundPosition = getComputedStyle(document.getElementById("target"))
    .backgroundPosition;

  shouldBe(targetBackgroundPosition, "25% 75%");
}
