/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Removing a class affected by a selector.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      .b .a { background-color: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="b"><div class="a">You should see no red.</div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetLeft; // force style recalc
  document.body.queryAll("div")[1].className = "";
  shouldBe(getComputedStyle(document.body.queryAll('div')[1], null).backgroundColor, 'rgba(0, 0, 0, 0)');
}
