/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a for-in statement of the form await for
 * (finalConstVarOrType? id in e) s proceeds as follows:
 *    The expression e is evaluated to an object o. It is a dynamic error if o
 *  is not an instance of a class that implements Stream. Otherwise,
 *  the expression await vf is evaluated, where vf is a fresh variable
 *  whose value is a fresh instance f implementing the built-in class Future.
 *    The stream o is listened to, and on each data event in o
 *  the statement s is executed with id bound to the value of the current
 *  element of the stream. If s raises an exception, or if o raises
 *  an exception, then f is completed with that exception. Otherwise, when
 *  all events in the stream o have been processed, f is completed with null.
 *
 * @description Check that a compile error occurs if o is not an instance
 * of a class that implements Stream
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

Future test2() async {
  await for (int i in [1, 2, 3]) {
  }
}

main() {
  asyncStart();
  test2().then(
          (value) => Expect.fail("Compile error is expected"),
          onError: (error) => asyncEnd()
          // TODO verify that error is a compile error
  );
}
