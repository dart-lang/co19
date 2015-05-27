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

main() {
  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="rdar://problem/7094146">rdar://problem/7094146</a>
          Reproducible crash at RenderObject::localToAbsolute()</i>.
      </p>
      <p>
          This crash occurred after an object&rsquo;s position changed directly
          from absolute to fixed, and it was not added to the RenderView&rsquo;s
          positioned objects list nor removed from its old container&rsquo;s list. 
      </p>
      <div style="position: relative;">
          <div id="target" style="top: 50px; position: absolute;">
              <div style="height: 50px; width: 50px; background-color: red;"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    document.body.offsetTop;
    var s = document.getElementById("target").style;
    s.setProperty("position", "fixed");
    document.body.offsetTop;
    s.setProperty("overflow", "hidden");
    s.setProperty("height", "0");
    s.setProperty("width", "0");
    document.body.offsetTop;
    s.setProperty("display", "none");
  }

  test();
}
