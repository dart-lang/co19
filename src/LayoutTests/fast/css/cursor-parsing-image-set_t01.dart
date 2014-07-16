/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the parsing of the cursor property when used with
 * -webkit-image-set.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  makeCursorRule(rule)
  {
    return "cursor: " + rule + ";";
  }

  roundtripCssRule(cssText)
  {
    var div = document.createElement("div");
    div.setAttribute("style", cssText);
    document.body.append(div);
    var result = div.style.cssText;
    div.remove();
    return result;
  }

  testCursorRule(rule)
  {
    var cssText = makeCursorRule(rule);
    shouldBeEqualToString(roundtripCssRule(cssText), cssText);
  }

  // Note that any absolute URL will suffice for these tests (can't use relative URLs
  // since they'll be converted to absolute form in the output).  I chose file URLs just
  // to avoid triggering any network activity.

  debug('Test a bunch of cursor rules which should round-trip exactly.');
  testCursorRule('-webkit-image-set(url(file:///foo.png) 1x), auto');
  testCursorRule('-webkit-image-set(url(file:///foo.png) 1x, url(file:///foo2x.png) 2x), auto');
  testCursorRule('-webkit-image-set(url(file:///foo.png) 1x, url(file:///foo2x.png) 2x) 2 3, auto');
  testCursorRule('-webkit-image-set(url(file:///foo03.png) 0.3x, url(file:///foo5x.png) 5x) 6 5, url(file:///foo.png) 12 3, pointer');
}
