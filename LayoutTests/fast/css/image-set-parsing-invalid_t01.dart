/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the parsing of the -webkit-image-set function.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var cssRule;

  testInvalidImageSet(description, property, rule) {
    debug("");
    debug(description + " : " + rule);

    var div = document.createElement("div");
    div.setAttribute("style", property + ": -webkit-image-set(" + rule + ")");
    document.body.append(div);

    //cssRule = div.style.getPropertyCssValue(property);
    //shouldBe(cssRule, null);
    cssRule = div.style.getPropertyValue(property);
    shouldBe(cssRule, '');

    div.remove();
  }

  testInvalidImageSet("Too many url parameters", "background-image", "url(#a #b)");
  testInvalidImageSet("No x", "background-image", "url('#a') 1");
  testInvalidImageSet("No comma", "background-image", "url('#a') 1x url('#b') 2x");
  testInvalidImageSet("Too many scale factor parameters", "background-image", "url('#a') 1x 2x");
  testInvalidImageSet("Scale factor is 0", "background-image", "url('#a') 0x");
  testInvalidImageSet("No url function", "background-image", "'#a' 1x");
}
