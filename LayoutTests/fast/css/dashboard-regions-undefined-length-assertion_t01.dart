/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description The test passes if it does not cause an assertion failure.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div style="-webkit-dashboard-region: dashboard-region(control rectangle)"></div>
      <p>The test passes if it does not cause an assertion failure.</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}
