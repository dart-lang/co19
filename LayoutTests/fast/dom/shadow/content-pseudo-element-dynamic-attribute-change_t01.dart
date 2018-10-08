/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description ::distributed pseudo elements with dynamic attribute change
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="host">
        <div id="child">I should be green.</div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var shadowRoot = document.getElementById('host').createShadowRoot();
  shadowRoot.setInnerHtml('''
    <style>content::content .selected {
    background: green; }</style>
    <content></content>,
    ''', treeSanitizer: new NullTreeSanitizer());

  bg(e) => e.getComputedStyle().backgroundColor;

  asyncStart();
  setTimeout(() {
    document.getElementById('child').classes.add('selected');
    setTimeout(() {
      shouldBe(bg(document.getElementById('child')), 'rgb(0, 128, 0)');
      asyncEnd();
    });
  });
}
