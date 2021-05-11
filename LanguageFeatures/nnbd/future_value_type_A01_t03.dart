// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let f be an asynchronous non-generator function with declared
/// return type T. Then the future value type of f is futureValueType(T). The
/// function futureValueType is defined as follows:
///
///  futureValueType(S?) = futureValueType(S), for all S.
///  futureValueType(S*) = futureValueType(S), for all S.
///  futureValueType(Future<S>) = S, for all S.
///  futureValueType(FutureOr<S>) = S, for all S.
///  futureValueType(void) = void.
///  futureValueType(dynamic) = dynamic.
///  Otherwise, for all S, futureValueType(S) = Object?.
///
/// @description Check that for asynchronous non-generator function with declared
/// return type futureValueType(FutureOr<S>?) = S, for all S. Check that it is no
/// error if type of return value is assignable to the future
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong
class C {}

Future<num?>? test1() async {
  return 3.14;
}

Future<num?>? test2() async {
  return Future<int>.value(42);
}

Future<num?>? test3() async {
  dynamic d = 42;
  return d;
}

Future<num?>? test4() async {
  return null;
}

main() {
  test1();
  test2();
  test3();
  test4();
}
