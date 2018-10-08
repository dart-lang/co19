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
  document.documentElement.style.direction = 'rtl';

  var expectedScrollX = -1000;
  var expectedScrollY = 500;

  window.onLoad.listen((_) {
    // Test horizontal scroll bar presents and was initially at the right for RTL page.
    debug("original scroll x for RTL page ");
    shouldBe(window.scrollX, 0);

    // Test horizontal scroll.
    debug("horizontal scroll: ");
    window.scrollTo(expectedScrollX, expectedScrollY);
    shouldBe(window.scrollX, expectedScrollX);
    // Test calling window.scrollX continuously wont change the scrollX position.
    debug("continuously call window.scrollX ");
    shouldBe(window.scrollX, expectedScrollX);

    // Test resize wont reset scroll position.
    window.resizeTo(1000, window.innerHeight);
    window.scrollTo(expectedScrollX, expectedScrollY);
    window.resizeTo(2000, window.innerHeight);
    debug("resize preserves scroll position");
    shouldBe(window.scrollX, expectedScrollX);

    // Test select all selects all document content.
    window.resizeTo(500, 500);
    var div = document.getElementById("div");
    div.focus();
    document.execCommand("SelectAll", false, '');
    var selection = window.getSelection();
    debug("selectAll selects all document");
    shouldBe(selection.toString().substring(0, div.innerHtml.length), div.innerHtml);
    div.style.display = "none";
    asyncEnd();
  });

  asyncStart();

  document.body.setInnerHtml('''
    <div id="div" style="whitespace:nowrap; width: 4000px; height: 1000px; border: 1px solid red;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</div>
    ''', treeSanitizer: new NullTreeSanitizer());
}

