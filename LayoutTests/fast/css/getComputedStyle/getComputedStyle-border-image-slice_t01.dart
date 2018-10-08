/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure border-image-slice is correctly parsed.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var testContainer = document.createElement("div");
  document.body.append(testContainer);

  testContainer.innerHtml = '<div style="width:100px;height:100px"><div id="test">hello</div></div>';

  var e = document.getElementById('test');
  var computedStyle = getComputedStyle(e, null);

  var testValues = [ "10", "30%", "10 10", "10 30%", "30% 30%", "10 10 10", "30% 10 10", "10 30% 10", "30% 30% 30% 10", "10 10 10 10", "30% 30% 30% 10", "30% 30% 30% 30%", "fill 30%", "fill 10", "fill 2 4 8% 16%", "30% fill", "10 fill", "2 4 8% 16% fill", "10 fill 10", "solid", "fill fill" ];

  var expectedValues = [ '10', '30%', '10', '10 30%', '30%', '10', '30% 10 10', '10 30%', '30% 30% 30% 10', '10', '30% 30% 30% 10', '30%', '30% fill', '10 fill', '2 4 8% 16% fill', '30% fill', '10 fill', '2 4 8% 16% fill', '100%', '100%', '100%' ];

  for (var i = 0; i < testValues.length; i++) {
    e.style.borderImageSlice = "";
    e.style.borderImageSlice = testValues[i];
    shouldBe(computedStyle.getPropertyValue('border-image-slice'), expectedValues[i]);
  }
}
