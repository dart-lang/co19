/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test performs a check for the :valid CSS selector on
 * various input and button elements.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
       :valid { background: lime; }
       :invalid { background: red; }
       input { background: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get">
      <input name="victim" type="text" value="Lorem ipsum"/>
      <input name="victim" type="text" value="Lorem ipsum" required/>
      <input name="victim" type="text" value="Lorem ipsum" pattern="Lorem ipsum"/>
      <input name="victim" type="submit">
      <button name="victim"></button>
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");
  for (var i = 0; i < v.length; i++)
    shouldBe(getComputedStyle(v[i], null).getPropertyValue('background-color'), 'rgb(0, 255, 0)');
}
