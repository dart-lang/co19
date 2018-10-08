/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a Load event is fired at an HTML Style element
 * after it successfully loads.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new StyleElement();

  style.onLoad.listen((_) {
    asyncEnd();
  });

  style.onError.listen((_) {
    testFailed('Fired Error event. Should have fired Load event.');
  });

  asyncStart();
  document.head.append(style);
}

