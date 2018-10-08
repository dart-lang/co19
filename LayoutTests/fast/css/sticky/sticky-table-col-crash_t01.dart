/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test position: sticky for table column groups.</p>
      <p>This test should not crash.</p>
      <div id=crashBox style="display: table-column-group; position: sticky;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  doTest(_) {
    document.getElementById('crashBox').scrollIntoView(ScrollAlignment.CENTER);
    asyncEnd();
  }

  asyncStart();
  window.addEventListener('load', doTest, false);
}
