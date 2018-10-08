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
      <a id="a">
          <span id="span">FAIL</span>
      </a>
      ''', treeSanitizer: new NullTreeSanitizer());

  // This tests a particular sequence of render tree changes, which
  // caused a crash in the code that maintains the line box tree.
  // Even small changes to the test make it no longer crash, so it
  // should be left as-is. That's why the test results don't say
  // anything about what this tests -- adding that caused the crash
  // to go away!

  turnAnchorIntoBlock()
  {
    document.getElementById("a").style.display = "block";
    (document.getElementById("span").firstChild as Text).data = "PASS";
    asyncEnd();
  }

  turnSpanIntoBlock()
  {
    document.body.offsetHeight; // trigger layout
    document.getElementById("span").style.display = "block";

    setTimeout(turnAnchorIntoBlock, 0);
  }

  asyncStart();
  setTimeout(turnSpanIntoBlock, 0);
}
