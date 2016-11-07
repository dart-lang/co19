/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for crbug.com/273960. Vendor prefixed pseudo elements
 * should not cause DOM exception 12 when using querySelector, querySelectorAll
 * and webkitMatchesSelector
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id='sandbox'></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  DivElement sandbox = document.getElementById('sandbox');

  sandbox.append(document.createElement("input"));
  shouldBeFalse((sandbox.firstChild as HtmlElement).matches("input[type=\'search\']::-webkit-search-decoration"));
  shouldBeNull((sandbox.firstChild as HtmlElement).querySelector("input[type=\'search\']::-webkit-search-decoration"));
  shouldBe((sandbox.firstChild as HtmlElement).querySelectorAll("input[type=\'search\']::-webkit-search-decoration").length, 0);

  sandbox.innerHtml = '';
}

