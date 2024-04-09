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
/// @description Checks that it is a compile-time error if `await e` occurs, and
/// the static type of `e` is `S?`, and `S` is incompatible with await.
/// @author sgrekhov22@gmail.com

import 'dart:async';

extension type V1(int _) {}

extension type V2<T>(T _) {}

extension type V3<T extends num>(T _) {}

extension type V4(Future<int> _) {}

extension type V5<T>(FutureOr<T> _) {}

extension type V6<T extends num>(Future<T>? _) {}

main() async {
  V1? v1 = V1(42);
  await v1;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String>? v2_1 = null;
  await v2_1;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2? v2_2 = V2("42");
  await v2_2;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V3<int>? v3_1 = V3(42);
  await v3_1;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V3? v3_2 = null;
  await v3_2;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V4? v4 = V4(Future<int>.value(42));
  await v4;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V5<String>? v5_1 = null;
  await v5_1;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V5<String>? v5_2 = V5("42");
  await v2_2;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V6<int>? v6_1 = V6(null);
  await v6_1;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V6? v6_2 = null;
  await v6_2;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
