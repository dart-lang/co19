/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that setting and getting display: grid and inline-grid
 * works as expected
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="grid" id="gridElement"></div>
      <div class="inline-grid" id="inlineGridElement"></div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    debug("Test getting |display| set through CSS");
    var gridElement = document.getElementById("gridElement");
    var inlineGridElement = document.getElementById("inlineGridElement");
    shouldBe(getComputedStyle(gridElement, '').getPropertyValue('display'), 'grid');
    shouldBe(getComputedStyle(inlineGridElement, '').getPropertyValue('display'), 'inline-grid');

    debug("");
    debug("Test getting and setting display through JS");
    var element = document.createElement("div");
    document.body.append(element);
    shouldBe(getComputedStyle(element, '').getPropertyValue('display'), 'block');
    element.style.display = "grid";
    shouldBe(getComputedStyle(element, '').getPropertyValue('display'), 'grid');

    element = document.createElement("div");
    document.body.append(element);
    shouldBe(getComputedStyle(element, '').getPropertyValue('display'), 'block');
    element.style.display = "inline-grid";
    shouldBe(getComputedStyle(element, '').getPropertyValue('display'), 'inline-grid');
    asyncEnd();
  });
}
