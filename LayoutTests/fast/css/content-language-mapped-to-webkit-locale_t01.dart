/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that -webkit-locale property contains content-language
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var meta = new Element.html('''
      <meta http-equiv="content-language" content="zh-CN">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(meta);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=76701">bug 76701</a>:
      map content-language to -webkit-locale.</p>
      <div id="console"></div>
      <div id="x"></div>
      <div id="y" lang="ar"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  if(document.getElementById('x').style.supportsProperty('-webkit-locale')) {

    languageOfNode(id) {
      var element = document.getElementById(id);
      return getComputedStyle(element).getPropertyValue('-webkit-locale');
    }

    shouldBeLikeString(languageOfNode('x'), "zh-CN");
    shouldBeLikeString(languageOfNode('y'), "ar");
  }
}
