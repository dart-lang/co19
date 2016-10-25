/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test works if it doesn't crash.
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.head.id = "head";

  dynamic style = new Element.html('''
      <style>
      * {background-image:inherit;}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
       <span></span>
       <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.style.background="-webkit-canvas(foo)";
  var head = document.getElementById("head");
  style = document.createElement("style");
  style.type = "text/css";
  var rule = new Text("* {content:counter(mycount_id)}");
  style.append(rule);
  head.append(style);
  document.body.setAttribute("style","line-height:128mm;");
}
