/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that shorthand border-image with a null image doesn't crash.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var testContainer = document.createElement("div");
  document.body.append(testContainer);

  testContainer.innerHtml = '<div id="test">hello</div>';

  var e = document.getElementById('test');
  var computedStyle = getComputedStyle(e);
  e.style.borderImage = "10% fill";

  shouldBe(computedStyle.getPropertyValue('border-image'), 'none');

  testContainer.remove();
}
