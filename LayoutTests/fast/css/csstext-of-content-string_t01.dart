/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests if a css text of content value is quoted when the value
 * is string.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html(r'''
      <style id='style'>
      #A::after { content: 'A'; }
      #B::after { content: '\'B\''; }
      #C::after { content: '\'C\''; }
      #D::after { content: '\'D\'' url(http://example.com/) 'EFG'; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id='A'></div>
      <div id='B'></div>
      <div id='C'></div>
      <div id='D'></div>
      <pre id='console'></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBeLikeString(style.sheet.cssRules[0].cssText, "#A::after { content: 'A'; }");
  shouldBeLikeString(style.sheet.cssRules[1].cssText, "#B::after { content: '\'B\''; }");
  shouldBeLikeString(style.sheet.cssRules[2].cssText, "#C::after { content: '\'C\\8\''; }");
  shouldBeLikeString(style.sheet.cssRules[3].cssText, "#D::after { content: '\'D\'' url(http://example.com/) 'EFG'; }");
}
