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
/// return type futureValueType(Future<S>?) = S, for all S. Test that
/// when return type of async function is Future<C>? then we cannot return C? from
/// the function
/// @author sgrekhov@unipro.ru

class C {}

Future<C>? foo() async {
  C? c = new C();
  bool b = (() => true)();
  if (b) {
    c = null;
  }
  return c;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  foo();
}
