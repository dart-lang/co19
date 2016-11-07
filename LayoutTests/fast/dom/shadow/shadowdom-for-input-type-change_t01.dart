/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test if changing input type keeps author ShadowRoot content.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <style>
    input, input[type="datetime-local"] {
        padding: 0;
        border: none;
        display: inilne-block;
        font-family: monospace;
    }
    </style>
    <input type="email">
    ''', treeSanitizer: new NullTreeSanitizer());

  InputElement input1 = document.querySelector('input');
  var initialWidth = input1.offsetWidth;
  shouldNotBe(initialWidth, 0);

  var root = input1.createShadowRoot();
  root.innerHtml = '<span>a</span>';
  var widthWithShadow = input1.offsetWidth;
  shouldNotBe(widthWithShadow, initialWidth);

  input1.type = "hidden"; 
  shouldBe(input1.offsetWidth, 0);
  input1.type = "datetime-local"; 
  shouldBe(input1.offsetWidth, widthWithShadow);
  input1.type = "range";
  shouldBeEqualToString(input1.value, '50');
  input1.focus();
  //eventSender.keyDown("rightArrow");
  //shouldBeEqualToString(input1.value, '50');
}
