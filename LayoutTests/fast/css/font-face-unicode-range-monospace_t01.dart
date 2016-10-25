/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description @font-face should not affect width of characters outside of its
 * unicode-range
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
        font-family: myfont;
        src: local(Courier), local('Courier New'); /* Use monospace font */
        unicode-range: U+0041; /* 'A' */
      }

      .test {
        font-size: 100px;
        display:inline-block;
        font-family: myfont,sans-serif;
        background: blue;
      }

      .sans {
        font-size: 100px;
        display:inline-block;
        font-family:sans-serif;
        background:red;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test" class="test">m</div>
      <div id="sans" class="sans">m</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById('test').offsetWidth, document.getElementById('sans').offsetWidth);
}
