/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that content-language meta tag is case insensitive
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var meta = new Element.html('''
      <meta http-equiv="cONtENT-LAnguAGE" content="ja-JP">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(meta);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=76701">bug 76701</a>:
      map content-language to -webkit-locale. This particular test tests that the
      matching of the http-equiv attribute to the content-language state is case
      insensitive.
      </p>
      <div id="console"></div>
      <div id="x"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var element = document.getElementById('x');
  if (element.style.supportsProperty('-webkit-locale')) {
    shouldBeLikeString(
        getComputedStyle(element).getPropertyValue('-webkit-locale'), "ja-JP");
  }
}
