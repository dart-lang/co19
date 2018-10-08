/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure outline-offset is found in the computed style.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var testContainer = document.createElement("div");
  document.body.append(testContainer);

  testContainer.setInnerHtml(
      '<div id="test" style="outline: 2px solid black">hello</div>',
      treeSanitizer: new NullTreeSanitizer());

  var e = document.getElementById('test');
  e.contentEditable = 'true';

  e.style.outlineOffset = "2px";
  var computedStyle = getComputedStyle(e);
  shouldBe(computedStyle.getPropertyValue('outline-offset'), '2px');
}
