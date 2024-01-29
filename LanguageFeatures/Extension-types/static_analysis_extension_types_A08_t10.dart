// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T is incompatible with await if at least one
/// of the following criteria holds:
/// - T is an extension type that does not implement Future.
/// - T is S?, and S is incompatible with await.
/// - T is X & B, and either:
/// - B is incompatible with await, or
/// - B does not derive a future type, and X is incompatible with await.
/// - T is a type variable with bound S, and S is incompatible with await.
/// Consider an expression of the form await e. A compile-time error occurs if
/// the static type of e is incompatible with await.
///
/// @description Checks that it is not an error if `await e` occurs, and
/// the static type of `e` is `T` where `T` is a type variable with bound `S`,
/// and `S` is compatible with await.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/static_type_helper.dart';

extension type ET(Future<num> n) implements Future<Object> {}

test<T1 extends num, T2 extends ET>(T1 t1, T2 t2) async {
  await t1;
  (await t2).expectStaticType<Exactly<Object>>();
}

main() {
  test(42, ET(Future<int>.value(42)));
}
