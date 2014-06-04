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

main() {
  document.body.setInnerHtml('''
      <p>This tests that the elements noframes, nolayer, noscript and noembed are created as elements and put in the DOM tree.
      The elements other than &lt;nolayer&gt; should not contain any children.
      If the test is successful, the four messages below will list 0, 0, 0, and 1 child.</p>
      <noframes id="noframes">This is noframes.</noframes>
      <noscript id="noscript">This is noscript.</noscript>
      <noembed id="noembed">This is noembed.</noembed>
      <nolayer id="nolayer">This is nolayer.</nolayer>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(id) {
    debug(id);
    var t = document.getElementById(id);
    shouldBe(t.childNodes.length, 1);
  }

  test('noframes');
  test('noscript');
  test('noembed');
  test('nolayer');
}
