/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If f is marked async, then a fresh instance o implementing the
 * built-in class Future is associated with the invocation and immediately
 * returned to the caller. The body of f is scheduled for execution at some
 * future time. The future o will complete when f terminates. The value used
 * to complete o is the current return value, if it is defined, and the
 * current exception otherwise.
 *
 * @description Check that body of the function is executed at some future time
 * after a fresh Future instance is returned to the caller.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

bool bodyExecuted = false;

Future test() async {
  bodyExecuted = true;
  return 1;
}

main() {
  for (var i = 0; i < 10; i++) {
    test();
    Expect.isFalse(bodyExecuted);
  }
}
