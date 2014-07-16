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
  var style = new Element.html('''
      <style>
          #dummy:nth-child(3) { }
          #container:first-line { color: blue; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=45344">https://bugs.webkit.org/show_bug.cgi?id=45344</a>
          Null deref in InlineBox::height()</i>.
      </p>
      <p>
          This test should not crash.
      </p>
      <div contentEditable>
          <img id="dummy">
          <div id="container"><span id="target"><br></span></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());
  
  document.getElementById("container").parentNode.focus();
}
