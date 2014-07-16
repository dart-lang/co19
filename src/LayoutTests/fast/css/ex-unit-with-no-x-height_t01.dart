/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures that the CSS 'ex' unit is treated as half the
 * size of the CSS 'em' unit when a font has no x-height information.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      .em { height: .5em; width: .5em; }
      .ex { height: 1ex; width: 1ex; }
      .cover { background: green; }
      .back { background: red; }
      .one { left: 10px; }
      .two { left: 70px; }
      #test > div { font-family: block; font-size: 100px; position: absolute; top: 10px; }
      #description { margin-top: 70px; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <svg xmlns = 'http://www.w3.org/2000/svg' style='display:none'>
        <defs>
          <font id="Font1">
            <font-face font-family="block" />
          </font>
        </defs>
      </svg>
      <div id='test'>
        <div class='back em one'></div>
        <div class='cover ex one' id='ex'></div>

        <div class='back ex two'></div>
        <div class='cover em two'></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  measureExBox() {
    return getComputedStyle(document.getElementById('ex')).width;
  }

  shouldBe(measureExBox(), '50px');
}
