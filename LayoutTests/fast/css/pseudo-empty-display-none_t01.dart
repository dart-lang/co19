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
      <style>
        p { background-color: green; width: 100px; height: 100px }
        p:empty { display: none }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=26570"> bug 26570</a>.
      There should be two green boxes on this page.<br>
      <p></p>
      <p>&#09;</p>
      <p></p>
      <p><span></span></p>
      <p></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var list = document.body.querySelectorAll("p");
  for (var result = "", i = 0; i < list.length; ++i) {
    shouldBe(list[i].offsetWidth, (100 * (i & 1)));
  }
}
