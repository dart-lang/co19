/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures we properly invalidate style when adding
 * children affected by direct adjacent sibling selectors.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="div1"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div1 = document.getElementById('div1');
  var div2 = document.createElement('div');
  div1.append(div2);
  var testDiv = document.createElement('div');
  testDiv.id = "testDiv";
  div2.append(testDiv);
  var style = document.createElement('style');
  document.documentElement.firstChild.append(style);
  style.append(new Text("#div1 > div + div > div { color: red; }\n"));

  // Recalc style with our test div not matching the selector
  getComputedStyle(testDiv, "").color;

  var trigger = document.createElement('div');
  div1.insertBefore(trigger, div2);
  shouldBe(getComputedStyle(testDiv).color, "rgb(255, 0, 0)");
}
