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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div style="-webkit-aspect-ratio: 1 / 2;">
        <div id="aspectRatioTest"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  testComputedValue(elementId, value, styleAttribute)
  {
    var div = document.getElementById(elementId);
    div.style.setProperty(styleAttribute, value);
    var computedValue = div.getComputedStyle().getPropertyValue(styleAttribute);
    return computedValue;
  }

  shouldBeEqualToString(testComputedValue("aspectRatioTest", "1 / 4", "-webkit-aspect-ratio"), '1/4');
  shouldBeEqualToString(testComputedValue("aspectRatioTest", "inherit", "-webkit-aspect-ratio"), '1/2');
  shouldBeEqualToString(testComputedValue("aspectRatioTest", "none", "-webkit-aspect-ratio"), 'none');
}
