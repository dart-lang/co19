/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Submitting forms with no action attribute
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var f = new DocumentFragment.html('''
      <base href="http://www.example.com/failure/">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=17042">bug 17042</a>: Forms without actions and a base tag submit incorrectly.</p>

      <form name="f" method="get">
      <input type="submit" value="Test"/>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  String url = window.location.href;

  bool firstRun = url.indexOf('?') == -1 ||
    url.substring(url.indexOf('?')+1, url.length) != "";

  if (firstRun) {
    FormElement form = document.getElementsByName('f')[0] as FormElement;
    form.submit();
  } else {
    shouldBe(url.substring(url.indexOf('?')+1, url.length), "");
  }
}
