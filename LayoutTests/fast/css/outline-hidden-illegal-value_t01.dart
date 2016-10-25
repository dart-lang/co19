/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description outline-style: illegal hidden value
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          p { margin: 2em; outline: .5em solid lime; outline-style: hidden }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>A test case for <a href="https://bugs.webkit.org/show_bug.cgi?id=19520">bug 19520 - "outline-style: hidden" should be ignored</a>.</div>
      <p>This line should have a green border.</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var x = document.getElementsByTagName("p")[0];
  shouldBe(getComputedStyle(x,null).getPropertyValue("outline-style"), "solid");
}
