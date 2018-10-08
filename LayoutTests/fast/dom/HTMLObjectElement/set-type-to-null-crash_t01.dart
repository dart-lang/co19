/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The test should not crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <object type="" id="crash"></object>
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();

  window.onLoad.listen((_) {
    (document.getElementById('crash') as ObjectElement).type = null;
    asyncEnd();
  });
}
