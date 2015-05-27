/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description clip computed style
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
     <style type="text/css">
       div { height: 5em; width: 10em; font-size:12px }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="clip" style="clip: rect(5px, 2em, 1px, 1em)" ></div>
      <div id="clip2" style="clip: auto" ></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById("clip");
  shouldBe(getComputedStyle(div,'').getPropertyValue("clip"), "rect(5px 24px 1px 12px)");

  div = document.getElementById("clip2");
  shouldBe(getComputedStyle(div,'').getPropertyValue("clip"), "auto");
}
