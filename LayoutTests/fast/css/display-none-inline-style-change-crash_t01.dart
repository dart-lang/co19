/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test should not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          /* dummy descendant rule */
          span li { color: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=15887">http://bugs.webkit.org/show_bug.cgi?id=15887</a> REGRESSION (r27576): Crash in RenderStyle::affectedByHoverRules clicking link on Digg</i>.
      </p>
      <p>
          This test should not crash.
      </p>
      <div id="target" style="display: none;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("target").style.color = "blue";
}
