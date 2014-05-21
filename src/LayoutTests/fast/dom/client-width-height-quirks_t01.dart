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
    This tests that clientWidth/clientHeight on the body element in quirks mode returns the visible size of the frame.
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  debug(str) {
    var pre = document.getElementById('console');
    pre.append(new Text(str + '\n'));
  }

  if (document.body.clientWidth != window.innerWidth ||
      document.body.clientHeight != window.innerHeight) {
        debug("test1");
        debug("FAIL");
        return;
  }

  // Now force scroll bars. innerWidth and innerHeight should not take the scroll bar into account
  // but clientWidth and clientHeight should.
  document.body.style.overflow = 'scroll';
  document.body.offsetTop;

  if (document.body.clientWidth >= window.innerWidth ||
      document.body.clientHeight >= window.innerHeight) {
        debug("test2");
        debug("FAIL");
        return;
  }

  debug("PASS");
}
