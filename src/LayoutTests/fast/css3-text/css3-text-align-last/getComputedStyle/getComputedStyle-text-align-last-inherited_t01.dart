/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that the value of text-align-last is properly
 * inherited to the child.
 */
import "dart:html";
import "../../../../testcommon.dart";
import "../../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id="ancestor"><div id="child">hello world</div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ancestor, child;

  testComputedStyle(a_value, c_value)
  {
    shouldBe(getComputedStyle(ancestor).getPropertyValue('text-align-last'),  a_value);
    shouldBe(getComputedStyle(child).getPropertyValue('text-align-last'),  c_value);
  }

  ownValueTest(a_value, c_value)
  {
    debug("Value of ancestor is '" + a_value + ", while child is '" + c_value + "':");
    ancestor.style.textAlignLast = a_value;
    child.style.textAlignLast = c_value;
    testComputedStyle(a_value, c_value);
  }

  inheritanceTest(a_value)
  {
    debug("Value of ancestor is '" + a_value + "':");
    ancestor.style.textAlignLast = a_value;
    testComputedStyle(a_value, a_value);
  }

  ancestor = document.getElementById('ancestor');
  child = document.getElementById('child');

  inheritanceTest("start");
  inheritanceTest("end");
  inheritanceTest("left");
  inheritanceTest("right");
  inheritanceTest("center");
  inheritanceTest("justify");
  inheritanceTest("auto");

  ownValueTest("start", "end");
  ownValueTest("left", "right");
}
