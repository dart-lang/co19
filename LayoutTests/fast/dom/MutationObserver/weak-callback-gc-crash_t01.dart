/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passes if it does not crash
 * @needsreview
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var observer = new MutationObserver((m,o) {
    testFailed('Should not be called');
  });
  var div = document.createElement('div');
  observer.observe(div, attributes: true);
  div.id = 'foo';
  div = null;
  observer = null;
  setTimeout((){}, 0);
}
