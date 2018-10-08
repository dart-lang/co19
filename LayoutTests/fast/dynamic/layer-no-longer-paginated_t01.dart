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
import "../../resources/run-after-display.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="rdar://problem/10098679">&lt;rdar://problem/10098679></a>
          Assertion failure in <tt>RenderLayer::paintPaginatedChildLayer()</tt></i>.
      </p>
      <p>
          The test passes if it does not cause an assertion failure or a crash.
      </p>
      <!-- specifying opacity < 1 so that the transition from having columns
           to not having columns does not cause the layer to go away -->
      <div id="target" style="-webkit-column-count:2; column-count:2; column-fill:auto; opacity: 0.5; height: 20px;">
          <div style="position:relative;"></div>
      </div>
      <div id="widener" style="height: 10px; width: 200%;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.body.setAttribute("style", "overflow: hidden;");

  test()
  {
    document.getElementById("widener").style.removeProperty("width");
    document.getElementById("target").style.removeProperty("-webkit-column-count");
  }

  window.scrollBy(1, 0);
  runAfterDisplay(test);
}
