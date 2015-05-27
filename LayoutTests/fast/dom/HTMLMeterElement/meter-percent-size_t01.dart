/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that percentage sizes on a meter element doesn't crash.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <meter style="width: 1%;">30%</meter>
    <meter style="height: 1%;">30%</meter>
    <meter style="margin: 1%;">30%</meter>
    <meter style="padding: 1%;">30%</meter>
    PASS
    ''', treeSanitizer: new NullTreeSanitizer());
}
