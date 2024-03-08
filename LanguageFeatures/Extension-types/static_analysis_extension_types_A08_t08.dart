// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T is incompatible with await if at least one
/// of the following criteria holds:
/// - T is an extension type that does not implement Future.
/// - T is S?, and S is incompatible with await.
/// - T is X & B, and B is incompatible with await.
/// - T is a type variable with bound S, and S is incompatible with await.
/// Consider an expression of the form await e. A compile-time error occurs if
/// the static type of e is incompatible with await.
///
/// @description Checks that it is not an error if `await e` occurs, and the
/// static type of `e` is `X & B` and both `X` and `B` are compatible with await
/// @author sgrekhov22@gmail.com

import 'dart:async';

extension type IntET(int _) {}
extension type ET(Future<int> _) implements Future<int> {}

test<X extends FutureOr<num>>(X x) async {
  if (x is num) {
    await x;
  }
  if (x is FutureOr<int>) {
    await x;
  }
  if (x is ET) {
    await x;
  }
  if (x is ET?) {
    await x;
  }
}

main() {
  test(Future<num>.value(42));
  test(Future<int>.value(42));
  test(42);
}
