/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure -webkit-column-rule property returns
 * CSSValueList properly.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var testContainer = document.createElement("div");
  testContainer.contentEditable = 'true';
  document.body.append(testContainer);

  testContainer.setInnerHtml(
      '<div id="test" style="-webkit-column-rule: thin dotted black;">hello</div>',
      treeSanitizer: new NullTreeSanitizer());

  var e = document.getElementById('test');
  var computedStyle = getComputedStyle(e, null);

  shouldBeEqualToString(computedStyle.getPropertyValue('-webkit-column-rule'), '1px dotted rgb(0, 0, 0)');

  e.style.setProperty('-webkit-column-rule', "10px red");
  shouldBeEqualToString(computedStyle.getPropertyValue('-webkit-column-rule'), '0px none rgb(255, 0, 0)');

  e.style.setProperty('-webkit-column-rule-width', "medium");
  e.style.setProperty('-webkit-column-rule-style', "dashed");
  shouldBeEqualToString(computedStyle.getPropertyValue('-webkit-column-rule'), '3px dashed rgb(255, 0, 0)');

  e.style.setProperty('-webkit-column-rule', "10px dotted blue");
  e.style.setProperty('-webkit-column-rule-style', "none");
  shouldBeEqualToString(computedStyle.getPropertyValue('-webkit-column-rule'), '0px none rgb(0, 0, 255)');

  e.style.setProperty('-webkit-column-rule-style', "hidden");
  shouldBeEqualToString(computedStyle.getPropertyValue('-webkit-column-rule'), '0px hidden rgb(0, 0, 255)');
}
