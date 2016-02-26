/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that in the event of multiple content-languages,
 * the final content-language is used as the pragma-set default language
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var meta = new DocumentFragment.html('''
      <meta http-equiv="content-language" content="   ">
      <meta http-equiv="content-language" content="ja_JP">
      <meta http-equiv="content-language" content="zh_CN">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(meta);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=76701">bug 76701</a>:
      map HTTP-EQUIV content-language to -webkit-locale. This particular test tests
      that in the event of multiple content-languages, the final content-language is
      used as the pragma-set default language. This expectation may change, see bug.
      The HTML5 spec decrees that the first successfully processed one be used.
      Firefox and IE seem to use the final one.
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

    shouldBeLikeString(languageOfNode('x'), "zh_CN");
    shouldBeLikeString(languageOfNode('y'), "ar");
  }
}
