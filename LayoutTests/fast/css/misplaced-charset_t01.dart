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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
      div.a {background-color: red;}
      @charset "XXX";
      div.a {background-color: green !important;}
      @charset "XXX";
      div.b {background-color: green !important;}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=36515">bug 36515</a>:
      CSS style definitions are ignored if they just follow a "@charset" which appears in lines other than the first line in stylesheet.</p>
      <p>There should be two green squares below:</p>
      <div class="a" style="height:100px; width:100px;"></div><br>
      <div class="b" style="height:100px; width:100px; background-color:red;"></div>
      <div style="height:5px; width:5px; background-color:green; visibility: hidden"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var expected = getComputedStyle(document.body.queryAll("div")[2], null).backgroundColor;
  shouldBe(getComputedStyle(document.body.queryAll("div")[0], null).backgroundColor, expected);
  shouldBe(getComputedStyle(document.body.queryAll("div")[1], null).backgroundColor, expected);
}
