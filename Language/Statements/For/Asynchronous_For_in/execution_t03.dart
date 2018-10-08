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
 * @description Check that if s raises an exception, then asynchronous for-in
 * statement is completed with that exception.
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

final ERROR = new Exception();

Future test1() async {
  var processedValues = [];
  try {
    await for (var i in new Stream.fromIterable([1, 2])) {
      processedValues.add(i);
      throw ERROR;
    }
    Expect.fail("Asynchronous for-in statement should throw $ERROR");
  } catch (e) {
    Expect.identical(ERROR, e);
  }
  Expect.listEquals([1], processedValues);
}

Future test2() async {
  var processedValues = [];
  try {
    await for (int i in new Stream.empty()) {
      processedValues.add(i);
      throw ERROR;
    }
    Expect.listEquals([], processedValues);
  } catch (e) {
    Expect.fail("Asynchronous for-in statement should not throw $e " +
      "for empty stream");
  }
}

main() {
  asyncStart();
  Future.wait([test1(), test2()]).then((v) => asyncEnd());
}
