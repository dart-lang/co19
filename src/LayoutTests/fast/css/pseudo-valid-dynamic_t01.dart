/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that input element that share style, no longer
 * share style after validity rules are dynamically added.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style id="sty">
          input { background: blue; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get">
      <input name="victim" type="text"/>
      <input name="victim" type="text" value="Loremipsum" pattern="Lorem ipsum"/>
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var s1 = (document.getElementById('sty') as StyleElement).sheet;
  s1.insertRule(':valid { background: lime; }', s1.cssRules.length);

  var v = document.getElementsByTagName("input");

  shouldBe(getComputedStyle(v[0], null).getPropertyValue('background-color'), 'rgb(0, 255, 0)');
  shouldBe(getComputedStyle(v[1], null).getPropertyValue('background-color'), 'rgb(0, 0, 255)');
}
