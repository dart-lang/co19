/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the setting of the -webkit-image-set function.

 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  testComputedStyle(property, fullRule)
  {
    var div = document.createElement("div");
    document.body.append(div);
    div.setAttribute("style", property + ": " + fullRule);
    var computedValue = div.style.backgroundImage;
    div.remove();
    return computedValue;
  }

  testImageSetRule(description, property, rule)
  {
    debug(description + " : " + rule);

    var fullRule = "-webkit-image-set(" + rule + ")";
    shouldBeLikeString(testComputedStyle(property, fullRule), fullRule);
  }

  testImageSetRule("Single value for background-image",
      "background-image",
      "url(http://www.webkit.org/a) 1x");

  testImageSetRule("Multiple values for background-image",
      "background-image",
      "url(http://www.webkit.org/a) 1x, url(http://www.webkit.org/b) 2x");

  testImageSetRule("Multiple values for background-image, out of order",
      "background-image",
      "url(http://www.webkit.org/c) 3x, url(http://www.webkit.org/b) 2x, url(http://www.webkit.org/a) 1x");

  testImageSetRule("Duplicate values for background-image",
      "background-image",
      "url(http://www.webkit.org/c) 1x, url(http://www.webkit.org/b) 2x, url(http://www.webkit.org/a) 1x");

  testImageSetRule("Fractional values for background-image",
      "background-image",
      "url(http://www.webkit.org/c) 0.2x, url(http://www.webkit.org/b) 2.3x, url(http://www.webkit.org/a) 12.3456x");

  // FIXME: We should also be testing the behavior of negative values somewhere, but it's currently
  // broken.  http://wkb.ug/100132
}

