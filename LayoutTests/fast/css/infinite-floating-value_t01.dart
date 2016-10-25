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
      <p>This test passes if it does not crash.</p>
      <svg xmlns="http://www.w3.org/2000/svg">
          <polyline font-size="8E+617%">
      </svg>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
