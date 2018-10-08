/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that an Error event is fired at a programmatically
 * inserted HTML Style element whose @import style sheet failed to load.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../HTMLLinkElement/resources/link-load-utilities.dart";

main() {
  var style =
    createStyleElementWithString('@import "IntentionallyMissingFile.css";');

  style.onLoad.listen((_) {
    testFailed('Fired Load event. Should have fired Error event.');
  });

  style.onError.listen((_) {
    asyncEnd();
  });

  asyncStart();
  document.head.append(style);
}
