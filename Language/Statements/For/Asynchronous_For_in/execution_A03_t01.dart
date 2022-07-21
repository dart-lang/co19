// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be derived from <finalConstVarOrType>?. Execution of a
/// for-in statement, `f`, of the form `await for (D id in e) s` proceeds as
/// follows:
///
/// The expression `e` is evaluated to an object `o`. It is a dynamic type error
/// if `o` is not an instance of a class that implements [Stream]. It is a
/// compile-time error if `D` is empty and id is a final variable.
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
/// @description Check that for each data event from `u`, the statement `s` is
/// executed with `id` bound to  the value of the current data event.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../../Utils/expect.dart';

Future test1() async {
  var processedValues = [];
  await for (var i in new Stream.fromIterable([1, 2, 3])) {
    processedValues.add(i);
  }
  Expect.listEquals([1, 2, 3], processedValues);
}

Future test2() async {
  var processedValues = [];
  await for (var i in new Stream.fromIterable(['a', 'b' ,'c'])) {
    processedValues.add(i);
  }
  Expect.listEquals(['a', 'b', 'c'], processedValues);
}

Future test3() async {
  var processedValues = [];
  await for (var i in new Stream.empty()) {
    processedValues.add(i);
  }
  Expect.listEquals([], processedValues);
}

main() {
  asyncStart();
  Future.wait([test1(), test2(), test3()]).then((v) => asyncEnd());
}
