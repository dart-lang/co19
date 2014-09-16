/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 * @description test just fails
 */
import 'dart:html';
import "../expectWeb.dart";

main() {
test(() {
  var ev = new Event("type");
  var target = document.createElement("div");

  asyncStart();
  target.addEventListener("type", (e) {
    print("about to throw");
    Expect.fail("as designed");
    asyncEnd();
  });

  target.dispatchEvent(ev);
}, "async fail");

checkTestFailures();
}
