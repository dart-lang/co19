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
      #test0 * { background-color: red; }
      #test0 :first-of-type { background-color: blue; }
      #test1 :-webkit-any(*) { background-color: red; }
      #test1 :-webkit-any(:first-of-type) { background-color: blue; }
      #test2 :not(i) { background-color: red; }
      #test2 :not(:last-of-type) { background-color: blue; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test0">
          <p>test0 foo</p>
          <p>test0 bar</p>
      </div>
      <div id="test1">
          <p>test1 foo</p>
          <p>test1 bar</p>
      </div>
      <div id="test2">
          <p>test2 foo</p>
          <p>test2 bar</p>
      </div>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  assertColor(selectorOrElement, rbgColor) {
    debug("");
    var element;

    if (selectorOrElement is String) {
      debug(selectorOrElement);
      element = document.querySelector(selectorOrElement);
    } else {
      debug("Element: " + element.nodeName);
      element = selectorOrElement;
    }

    shouldBe(getComputedStyle(element, null).getPropertyValue('background-color'), rbgColor);
  }

  assertBlue(selectorOrElement) {
    assertColor(selectorOrElement, 'rgb(0, 0, 255)');
  }

  assertRed(selectorOrElement) {
    assertColor(selectorOrElement, 'rgb(255, 0, 0)');
  }

  assertBlue("#test0 :first-of-type");
  assertRed("#test0 :last-of-type");
  assertBlue("#test1 :first-of-type");
  assertRed("#test1 :last-of-type");
  assertBlue("#test2 :first-of-type");
  assertRed("#test2 :last-of-type");
}
