/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that capturing event listeners will be invoked by
 * events dispatched to the target which it has been added to.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <input id="theButton" type="button">
    ''', treeSanitizer: new NullTreeSanitizer());

  var success = false;

  handler(event) {
    success = true;
  }

  var b = document.getElementById('theButton');
  b.addEventListener('click', handler, true);
  b.click();

  shouldBeTrue(success);
}
