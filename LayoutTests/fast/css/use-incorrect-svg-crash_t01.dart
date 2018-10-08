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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
        font-family: test;
        src: url($root/resources/incorrect-font.svg) format("svg");
      }
      .customFont {
        font-family: test;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="customFont">PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}

