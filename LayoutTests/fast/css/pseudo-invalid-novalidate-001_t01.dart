/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that an input element that doesn't validate
 * and an invalid input don't share style.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var styles = new DocumentFragment.html('''
      <style>
       :invalid { background: lime; }
       :valid { background: red; }
       input { background: blue; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(styles);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get">
      <input type="text" required disabled/>
      <input name="victim" type="text" value="Loremipsum" pattern="Lorem ipsum"/>
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByTagName("input");

  shouldBe(getComputedStyle(v[0], null).getPropertyValue('background-color'),
      'rgb(0, 0, 255)');
  shouldBe(getComputedStyle(v[1], null).getPropertyValue('background-color'),
      'rgb(0, 255, 0)');
}
