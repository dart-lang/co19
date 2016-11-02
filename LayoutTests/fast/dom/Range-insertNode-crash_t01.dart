/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that we don't crash when passing null to
 * Range.insertNode().  (rdar://problem/5488478)
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic r = document.createRange();
  try {
    r.insertNode(r);
  } catch(e) {
  }

  debug('PASS: No crash.');
}