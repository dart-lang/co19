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

main() {
  var style = new Element.html('''
      <style>
      .outerx .mid .inner {
          background-color: red;
      }
      .outery .mid .inner {
          background-color: green;
      }
      .inner {
          width: 50px;
          height: 50px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      This test succeeds if the two blocks show red and green repectively:
      <div id="x">
          <div class="mid">
              <div class="inner">
              </div>
          </div>
      </div>
      <div id="y">
          <div class="mid">
              <div class="inner">
              </div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var x = document.getElementById("x");
  x.classes.add("outerx");

  var y = document.getElementById("y");
  y.classes.add("outery");

  var colorX = getComputedStyle(x.children[0].children[0]).backgroundColor;
  var colorY = getComputedStyle(y.children[0].children[0]).backgroundColor;

  shouldNotBe(colorX, colorY);
}
