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
/// static type of `e` is `X & B` and `X` does not derive a future type, but `B`
/// does
/// @author sgrekhov22@gmail.com
/// @issue 56405

import 'dart:async';

extension type ObjectET(Object _) implements Object {}
extension type FutureIntET(Future<int> _) implements Future<int>, ObjectET {}

test<X extends ObjectET?>(X x) async {
  if (x is FutureIntET) {
    await x;
  }
  if (x is FutureIntET?) {
    await x;
  }
}

main() {
  test(FutureIntET(Future<int>.value(42)));
}
