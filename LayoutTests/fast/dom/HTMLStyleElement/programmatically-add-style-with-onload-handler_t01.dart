/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a Load event is fired at a programmatically
 * inserted HTML Style element once it loads its style sheet.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../HTMLLinkElement/resources/link-load-utilities.dart";

main() {
  var style =
    createStyleElementWithString("");

  style.onLoad.listen((_) {
    asyncEnd();
  });

  style.onError.listen((_) {
    testFailed('Fired Error event. Should have fired Load event.');
  });

  asyncStart();
  document.head.append(style);
}
