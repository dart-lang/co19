/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Property is declared twice in rule
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html('''
      <style type="text/css">
          div
          {
              color: red;
              color: green !important;
              color: yellow;
              width: 1px;
              width: 2px !important;
              width: 3px !important;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>This text should be green and the page should have no other style.</div>
      <div id="testresult">Fail</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  CssStyleSheet ss = document.styleSheets[index];
  CssStyleRule sr = ss.cssRules[0];
  var st = sr.style;

  shouldBe(st.length, 2);
  shouldBe(st.getPropertyValue("color"), "green");
  shouldBe(st.getPropertyPriority("color"), "important");
  shouldBe(st.getPropertyValue("width"), "3px");
  shouldBe(st.getPropertyPriority("width"), "important");
}
