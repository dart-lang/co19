/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/dom/events/EventTarget-dispatchEvent.html
 *
 * @description Exceptions from event listeners must not be propagated.
 * @needsreview dom.spec.whatwg.org spec differs from the dart's one
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  // https://www.w3.org/Bugs/Public/show_bug.cgi?id=17713
  // https://www.w3.org/Bugs/Public/show_bug.cgi?id=17714
  var ev = new Event("type", canBubble:false, cancelable:false);
  var called = [];
  var target = document.createElement("div");
  target.addEventListener("type", (ev) {
    asyncEnd();
    called.add("First");
    throw new Exception("intentional");
  }, false);

  target.addEventListener("type", (ev) {
    asyncEnd();
    called.add("Second");
  }, false);

  asyncMultiStart(2);
  Expect.isTrue(target.dispatchEvent(ev), "dispatchEvent must return true");
  Expect.listEquals(called, ["First", "Second"],
                      "Should have continued to call other event listeners");
}
