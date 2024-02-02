// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if `await e` occurs, and
/// the static type of `e` is an extension type which is not a subtype of
/// `Future<T>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V0(Future<int> _) {}

extension type V1(Future<int> _) {}

extension type V2<T extends Future<Object>>(T _) {}

extension type V3(Future<int> _) implements V0 {}

main() async {
  V1 v1 = V1(Future<int>.value(42));
  await v1;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<Future<String>> v2 = V2(Future<String>.value("42"));
  await v2;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V3 v3 = V3(Future<int>.value(42));
  await v3;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
