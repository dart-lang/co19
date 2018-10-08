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
  var style = new Element.html('''
      <style>
          div { width: 100px; height: 100px; }
          #target { margin-top: -100px; background-color: green; }
          #target:empty { display: none; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          This tests that specifying <tt>display: none;</tt> for the <tt>:empty</tt>
          pseudoclass doesn&rsquo;t affect non-empty elements.
      </p>
      <div style="background-color: red;"></div>
      <div id="target"><span></span></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("target").offsetWidth, 100);
}
