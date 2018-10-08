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
 * @description Check that if o raises an exception, then asynchronous for-in
 * statement is completed with that exception.
 *
 * @issue 24766
 * @issue 24748
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

final ERROR = new Exception();

Future<int> f() async {
  throw ERROR;
}

Future test1() async {
  var processedValues = [];
  try {
    await for (var i in f().asStream()) {
      processedValues.add(i);
    }
    Expect.fail("Asynchronous for-in statement should throw $ERROR");
  } catch (e) {
    Expect.identical(ERROR, e);
  }
  Expect.listEquals([], processedValues);
}

int computation(int computationCount) {
  if (computationCount < 5) {
    return computationCount;
  }
  throw ERROR;
}

Future test2() async {
  var processedValues = [];
  var period = new Duration(microseconds: 1);
  try {
    await for (var i in new Stream.periodic(period, computation)) {
      processedValues.add(i);
    }
    Expect.fail("Asynchronous for-in statement should throw $ERROR");
  } catch (e) {
    Expect.identical(ERROR, e);
  }
  Expect.listEquals([0, 1, 2, 3, 4], processedValues);
}

// try an already closed single subscription stream
Future test3() async {
  // make a stream that is closed
  Stream stream = new Stream.fromIterable([1, 2]);
  await for (var x in stream) {
  }
  var processedValues = [];
  try {
    await for (var i in stream) {
      processedValues.add(i);
    }
    Expect.fail("Asynchronous for-in statement should complete with error");
  } catch (e) {
    // the exception type is not specified
    // neither in Dart Language Specification nor in Dart Async API
    // (see issue 24748)
    // so just catch it
  }
  Expect.isTrue(processedValues.isEmpty);
}


main() {
  asyncStart();
  Future.wait([test1(), test2(), test3()]).then((v) => asyncEnd());
}
