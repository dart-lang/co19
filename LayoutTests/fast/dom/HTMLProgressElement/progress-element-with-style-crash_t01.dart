/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=50341.
 * It is not OK to crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <progress style='font: 1 required'/>
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  // It is necessary to allow some time for the progress bar to render the
  // progress and produce the crash.
  setTimeout(() {
    asyncEnd();
  }, 10);
}
