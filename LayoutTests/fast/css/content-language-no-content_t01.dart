/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description  Test that a content-language with missing content is
 * effectively ignored
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var meta = new DocumentFragment.html('''
      <meta http-equiv="content-language">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(meta);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=76701">bug 76701</a>:
      map HTTP-EQUIV content-language to -webkit-locale. This particular test tests that
      a content-language with missing content is effectively ignored. This expectation
      may change, see comments in bug.
      </p>
      <div id="console"></div>
      <div id="x"></div>
      <div id="y" lang="ar"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  if(document.getElementById('x').style.supportsProperty('-webkit-locale')) {

    languageOfNode(id) {
      var element = document.getElementById(id);
      return getComputedStyle(element).getPropertyValue('-webkit-locale');
    }

    shouldBeLikeString(languageOfNode('x'), "auto");
    shouldBeLikeString(languageOfNode('y'), "ar");
  }
}
