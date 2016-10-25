/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test performs a check for the :valid CSS selector on a
 * select element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
       :valid { background: lime; }
       :invalid { background: red; }
       select { background: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get">
      <select name="victim"><option>Lorem ipsum</option></select>
      <select name="victim" required><option>empty</option><option>another</option></select>
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");
  for (var i = 0; i < v.length; i++)
    shouldBe(getComputedStyle(v[i], null).getPropertyValue('background-color'), 'rgb(0, 255, 0)');
}
