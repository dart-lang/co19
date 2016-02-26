/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that content-language meta tag can be removed dynamically
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var meta = new Element.html('''
      <meta id="target" http-equiv="content-language" content="zh">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(meta);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=76701">bug 76701</a>:
      map http-equiv content-language to -webkit-locale. This particular test tests
      that dynamically removing the meta element has no effect. This
      expectation may change, see bug. The HTML 5 spec decrees that the
      pragma-set default language be changed only when the meta element is
      <a href="http://dev.w3.org/html5/spec/Overview.html#insert-an-element-into-a-document">inserted into the document</a>.
      In Firefox and IE removing the meta element doesn't seem to affect the page,
      but in Firefox the meta content-language displayed in "Page Information" is
      affected.
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

    shouldBeLikeString(languageOfNode('x'), "zh");
    shouldBeLikeString(languageOfNode('y'), "ar");

    meta.remove();

    shouldBeLikeString(languageOfNode('x'), "zh");
    shouldBeLikeString(languageOfNode('y'), "ar");
  }
}
