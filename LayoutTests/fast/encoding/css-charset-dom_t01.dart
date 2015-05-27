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
import "pwd.dart";

main() {
  var index = document.styleSheets.length; // skip test framework's ones

  var f = new DocumentFragment.html('''
      <meta content="text/html; charset=windows-1251" http-equiv="Content-Type"/>
      <link rel="stylesheet" type="text/css" href="$root/css-charset.css" charset="windows-1251">
      <!-- The document charset and link charset have lower priority than @charset, so they 
           shouldn't affect anything. -->
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=10676">bug 10676</a>:
      @charset rules not accessible via DOM</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(_) {
    var charsetRule = (document.styleSheets[index] as CssStyleSheet).cssRules[0];
    //shouldBe(charsetRule.runtimeType, 1);
    debug('cssText');
    shouldBe(charsetRule.cssText, '@charset "utf-8";');
    debug('encoding');
    shouldBe(charsetRule.encoding, 'utf-8');
    charsetRule.encoding = "koi8-r";
    debug('cssText after reset');
    shouldBe(charsetRule.cssText, '@charset "koi8-r";');
    debug('encoding after reset');
    shouldBe(charsetRule.encoding, 'koi8-r');
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(test);
}
