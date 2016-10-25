/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that the value of text-indent is properly
 * inherited to the child.
 */
import "dart:html";
import "../../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="ancestor"><div id="child"></div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ancestor, child;

  testComputedStyle(ancestorValue, childValue)
  {
    shouldBe(getComputedStyle(ancestor).getPropertyValue('text-indent'),  ancestorValue);
    shouldBe(getComputedStyle(child).getPropertyValue('text-indent'),  childValue);
    debug('');
  }

  ownValueTest(ancestorValue, childValue)
  {
    debug("Value of ancestor is '" + ancestorValue + "', while child is '" + childValue + "':");
    ancestor.style.textIndent = ancestorValue;
    child.style.textIndent = childValue;
    testComputedStyle(ancestorValue, childValue);
  }

  inheritanceTest(ancestorValue)
  {
    debug("Value of ancestor is '" + ancestorValue + "':");
    ancestor.style.textIndent = ancestorValue;
    testComputedStyle(ancestorValue, ancestorValue);
  }

  ancestor = document.getElementById('ancestor');
  child = document.getElementById('child');

  inheritanceTest("10px");
  inheritanceTest("10px each-line");
  inheritanceTest("10px hanging");
  inheritanceTest("10px each-line hanging");

  ownValueTest("10px each-line", "10px");
  ownValueTest("10px hanging", "10px");
  ownValueTest("10px each-line hanging", "10px");
}
