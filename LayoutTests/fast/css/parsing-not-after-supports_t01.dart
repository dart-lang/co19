/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for issue 257695: CSS @supports bug: breaks following :not()
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      span:not(.whatever) {
          background-color: red;
      }
      @supports (color: red) {
          span {
              color: red;
          }
      }
      span:not(.whatever) {
          background-color: green;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <span id='target'></span>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById('target');
  shouldBe(getComputedStyle(target).backgroundColor, "rgb(0, 128, 0)");
}
