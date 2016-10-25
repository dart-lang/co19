/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug: 80736 - CSSStyleDeclaration.getPropertyValue()
 * for 'border-radius' returns null when value is set
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var s = new Element.html('''
      <style>
       #element-container {
         border-radius:5px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(s);

  document.body.setInnerHtml('''
      <div id="element-container"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var element = document.getElementById("element-container");
  CssStyleRule sr = window.getMatchedCssRules(element, '')[0];
  var style = sr.style;
  shouldBe(style.getPropertyValue('border-radius'),'5px');
  shouldBe(style.getPropertyValue('border-top-left-radius'),'5px');
  shouldBe(style.getPropertyValue('border-top-right-radius'),'5px');
  shouldBe(style.getPropertyValue('border-bottom-left-radius'),'5px');
  shouldBe(style.getPropertyValue('border-bottom-right-radius'),'5px');
}
