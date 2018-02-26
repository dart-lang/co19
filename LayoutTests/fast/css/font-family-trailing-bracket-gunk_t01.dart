/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that we don't strip trailing gunk in brackets
 * from font families.
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.body.setInnerHtml('''
      <span id="testspan" style="font-family: 'Arial [ding dong]', 'Helvetica [Xft]', Courier">foo</span>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var spanElement = document.getElementById('testspan');

  var computedStyle = getComputedStyle(spanElement);
  shouldBe(spanElement.innerHtml, 'foo');
  shouldBeLikeString(computedStyle.getPropertyValue('font-family'),
      "'Arial [ding dong]', 'Helvetica [Xft]', Courier");

  spanElement.remove();
}
