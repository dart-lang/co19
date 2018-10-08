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
      <div>
          Test for <i><a href="rdar://problem/6634768">rdar://problem/6634768</a>
          Reproducible crash in RenderLayer::updateScrollCornerStyle() using full-page zoom at MobileMe Contacts</i>.
      </div>
      <div>
          The test passed if it did not crash.
      </div>
      <div id="target" style="
          overflow: auto;
          height: 200px;
          width: 200px;
      ">
          <div style="height: 500px;"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  scrolled(event)
  {
    event.target.remove();
    asyncEnd();
  }

  test()
  {
    var target = document.getElementById("target");
    target.scrollTop = 50;
    document.body.offsetTop;
    target.addEventListener("scroll", scrolled, false);
    document.body.style.zoom = '2';
  }

  asyncStart();
  test();
}
