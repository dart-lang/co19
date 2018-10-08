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
      <p>Test a bug that an assertion fails by invoking interactive validation twice very quickly.</p>

      <form>
      <input required style="float:left">
      <input type=submit id=submit>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var submit = document.getElementById('submit');

  submit.click();

  delayedSubmit() {
    submit.click();
    testPassed('Not crashed.');
    asyncEnd();
  }

  asyncStart();
  setTimeout(delayedSubmit, 0);
}

