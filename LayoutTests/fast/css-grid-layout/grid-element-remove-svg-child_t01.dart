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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <p>This test checks that removing a non-RenderBox grid item doesn't make us crash.</p>
      <p>This test has PASS if it didn't crash and you see PASS below.</p>
      <div class="grid">
          <svg xmlns='http://www.w3.org/2000/svg' version='1.1' height='190'>
            <polygon points='100,10 40,180 190,60 10,60 160,180' style='fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;'>
          </svg>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    dynamic grid = document.getElementsByClassName("grid")[0];
    grid.offsetTop;
    while (grid.firstChild != null)
      grid.firstChild.remove();
    grid.offsetTop;
    grid.innerHtml = "PASS";
    asyncEnd();
  });
}
