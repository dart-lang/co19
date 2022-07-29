// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be derived from <finalConstVarOrType>?. Execution of a
/// for-in statement, `f`, of the form `await for (D id in e) s` proceeds as
/// follows:
///
/// The expression `e` is evaluated to an object `o`. It is a dynamic type error
/// if `o` is not an instance of a class that implements [Stream]. It is a
/// compile-time error if `D` is empty and `id` is a final variable.
///
/// The stream associated with the innermost enclosing asynchronous for loop,
/// if any, is paused. The stream `o` is listened to, producing a stream
/// subscription `u`, and execution of the asynchronous for-in loop is suspended
/// until a stream event is available.
///
/// Pausing an asynchronous for loop means pausing the associated stream
/// subscription. A stream subscription is paused by calling its pause method.
/// If the subscription is already paused, an implementation may omit further
/// calls to pause.
///
/// For each data event from `u`, the statement `s` is executed with `id` bound
/// to  the value of the current data event.
///
/// If execution of `s` continues without a label, or to a label that prefixes
/// the asynchronous for statement, then the execution of `s` is treated as if
/// it had completed normally.
///
/// If execution of `s` otherwise does not complete normally, the subscription
/// `u` is canceled by evaluating `await v.cancel()` where `v` is a fresh
/// variable referencing the stream subscription `u`. If that evaluation throws,
/// execution of `f` throws the same exception and stack trace. Otherwise
/// execution of `f` completes in the same way as the execution of `s`.
/// Otherwise the execution of `f` is suspended again, waiting for the next
/// stream subscription event, and `u` is resumed if it has been paused.
///
/// On an error event from `u`, with error object `e` and stack trace `st`, the
/// subscription `u` is canceled by evaluating `await v.cancel()` where `v` is a
/// fresh variable referencing the stream subscription `u`. If that evaluation
/// throws, execution of `f` throws the same exception object and stack trace.
/// Otherwise execution of `f` throws with `e` as exception object and `st` as
/// stack trace.
///
/// When `u` is done, execution of `f` completes normally.
///
/// @description Check that if o raises an exception, then asynchronous for-in
/// statement is completed with that exception.
///
/// @issue 24766
/// @issue 24748
/// @author a.semenov@unipro.ru

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
  Stream<int> generator() async* {
    yield 42;
  }
  Stream stream = generator();
  await for (var i in stream) {
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
