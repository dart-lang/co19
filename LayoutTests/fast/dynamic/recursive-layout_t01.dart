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
          Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=14118">http://bugs.webkit.org/show_bug.cgi?id=14118</a>
          ASSERTION FAILED: !needsLayout() seen again</i>.
      </p>
      <p>
          No assertion failure here means SUCCESS.
      </p>
      <div id="target">This is something to select</div>
      <div id="foo"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    var target = document.getElementById("target");
    window.getSelection().setBaseAndExtent(target, 0, target, 0);
    document.body.offsetTop;

    var head = document.head;
    var link = document.createElement("link");
    link.setAttribute("href", "data:text/css,");
    link.setAttribute("rel", "stylesheet");
    // This will increase the pending stylesheet count
    head.append(link);
    // This will require layout
    document.getElementById('foo').style.width = "100px";
  }

  test();
}
