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
      <form>
      <input required>
      <input type=submit>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  check() {
    testPassed('Not crashed.');
    asyncEnd();
  }

  asyncStart();
  setTimeout(check, 10);
  document.body.querySelectorAll('input')[1].click();
}
