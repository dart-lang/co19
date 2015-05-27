/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test to make sure border-style shorthand property returns
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

  testContainer.innerHtml = '<div id="test">hello</div>';

  var e = document.getElementById('test');
  var computedStyle = getComputedStyle(e, null);

  e.style.borderStyle = "solid dotted";
  shouldBe(computedStyle.getPropertyValue('border-style'), 'solid dotted');

  e.style.borderStyle = "solid dotted groove dashed";
  shouldBe(computedStyle.getPropertyValue('border-style'), 'solid dotted groove dashed');
}
