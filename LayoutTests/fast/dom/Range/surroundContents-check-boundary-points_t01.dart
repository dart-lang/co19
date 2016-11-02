/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=21060">bug 21060</a>:
    Range#surroundContents incorrectly throws BAD_BOUNDARYPOINTS_ERR.</p>

    <p style="visibility:hidden">Hello, <em>Range</em> world!</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var range = document.createRange();
  var em = document.getElementsByTagName('em')[0];
  range.selectNode(em);
  var strong = document.createElement('strong');
  range.surroundContents(strong);
  var markup = (document.getElementsByTagName("p")[1] as HtmlElement).innerHtml;

  shouldBe(markup, 'Hello, <strong><em>Range</em></strong> world!');
}

