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
 * @description Event listeners added during dispatch should be called
 * @needreview actually listeners of ancestors are not called at all
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var results = [];
  var outerb = document.createElement("b");
  var middleb = outerb.append(document.createElement("b"));
  var innerb = middleb.append(document.createElement("b"));
  outerb.addEventListener("x", (e1) {
    print("outerb EventListener");
    asyncEnd();
    middleb.addEventListener("x", (e2) {
    print("middleb EventListener");
      asyncEnd();
      results.add("middle");
    }, true);
    results.add("outer");
  }, true);

  asyncMultiStart(2);
  innerb.dispatchEvent(new Event("x"));
//  Expect.listEquals(["outer", "middle"], results);
}
