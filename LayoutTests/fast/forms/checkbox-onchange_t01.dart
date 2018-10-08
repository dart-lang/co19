/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This is to test onchange of checkboxes
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input type="checkbox" id="ch">
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('ch').onChange.listen((_) {
    testPassed('onChange event fired for the checkbox.');
    asyncEnd();
  });

  asyncStart();
  document.getElementById('ch').click();
}
