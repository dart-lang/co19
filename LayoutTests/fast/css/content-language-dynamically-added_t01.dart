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

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.head.id = "head";

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=76701">bug 76701</a>:
      map http-equiv content-language to -webkit-locale. This particular test tests
      that a dynamically added content-language is processed. This expectation may
      change, see bug. The HTML 5 spec decrees that http-equiv content-language be
      processed when it is
      <a href="http://dev.w3.org/html5/spec/Overview.html#insert-an-element-into-a-document">inserted into the document</a>.
      In Firefox and IE adding the meta element dynamically doesn't seem to affect
      the page, but in Firefox the meta content-language displayed in "Page
      Information" is affected.
      </p>
      <div id="console"></div>
      <div id="x"></div>
      <div id="y" lang="ar"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  languageOfNode(id) {
    var element = document.getElementById(id);
    //return getComputedStyle(element).webkitLocale;
    return getComputedStyle(element).getPropertyValue('-webkit-locale');
  }

  shouldBeEqualToString(languageOfNode('x'), "auto");
  shouldBeEqualToString(languageOfNode('y'), "ar");

  var meta = document.createElement("meta");
  meta.httpEquiv = "content-language";
  meta.content = "ja";
  document.getElementById("head").append(meta);
  shouldBeEqualToString(languageOfNode('x'), "ja");
  shouldBeEqualToString(languageOfNode('y'), "ar");
}
