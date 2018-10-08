/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test computed style for the overflow property of select element</p>
      <div id="console"></div>

      <div id="test">
      <select id="wut" name="wut" size="8">
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
          <option value="4">Four</option>
          <option value="5">Five</option>
          <option value="6">Six</option>
          <option value="7">Seven</option>
          <option value="8">Eight</option>
          <option value="9">Nine</option>
          <option value="10">Ten</option>
      </select>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  computedOverflowStyle(overflowStyle, property) {
    var selectElement = document.getElementById("wut");
    selectElement.style.overflow = overflowStyle;
    return getComputedStyle(selectElement).getPropertyValue(property);
  }

  computedInheritedOverflowStyle(overflowStyle, property) {
    var divElement = document.getElementById("test");
    divElement.style.overflow = 'scroll';

    var selectElement = document.getElementById("wut");
    selectElement.style.overflow = overflowStyle;
    return getComputedStyle(selectElement).getPropertyValue(property);
  }

  shouldBe(computedOverflowStyle('scroll', 'overflow-x'), 'scroll');
  shouldBe(computedOverflowStyle('scroll', 'overflow-y'), 'scroll');

  shouldBe(computedInheritedOverflowStyle('inherit', 'overflow-x'), 'scroll');
  shouldBe(computedInheritedOverflowStyle('inherit', 'overflow-y'), 'scroll');
}
