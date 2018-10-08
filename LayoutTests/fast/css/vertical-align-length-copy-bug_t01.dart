/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=71996
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html('''
      <style>
      #testDiv a, #testDiv span{display:inline-block;border:1px solid black;}
      #testDiv a{width:30px;height:30px;text-align:center;line-height:30px;}
      #testDiv a span{width:10px;height:10px;opacity:0.9;vertical-align:-1px;}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id=testDiv style="position:absolute">
      <a><span id=test></span></a>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test = document.getElementById("test");
  style = getComputedStyle(test);
  shouldBeEqualToString(style.verticalAlign, "-1px");
  shouldBe(test.offsetTop, 10);
}
