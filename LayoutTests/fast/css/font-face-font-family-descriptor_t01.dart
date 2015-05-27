/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug 26183 - [@font-face] font-family descriptor with
 * multiple names should be discarded
 * font-family descriptor in @font-face rule can take only one family. Hence
 * the @font-face rule in this test must be ignored.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
      .testtext {
          font-size: 64px;
          font-family: Arial;
          border: solid 1px;
      }
      @font-face {
          font-family: myfont1, myfont2;
          src: local(Courier);
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <div id="description"></div>
      Test:<br/>
      <span id="testText" class="testtext" style="font-family: myfont1, Arial">Text iii</span><br/>
      Must match:<br/>
      <span id="mustMatch" class="testtext" style="font-family: Arial">Text iii</span><br/>
      Must not match:<br/>
      <span id="mustNotMatch" class="testtext" style="font-family: Courier">Text iii</span><br/>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBeTrue(document.getElementById('testText').offsetWidth == document.getElementById('mustMatch').offsetWidth);
  shouldBeTrue(document.getElementById('testText').offsetWidth != document.getElementById('mustNotMatch').offsetWidth);
}
