// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
/// ...
/// Case ⟨Asynchronous non-generator functions⟩. Consider the case where `f` is
/// an asynchronous non-generator function with future value type `Tv`.
/// ...
/// It is a compile-time error if `s` is `return e;`, `Tv` is `void`,
/// and `flatten(S)` is neither `void`, `dynamic`, `Null`.
///
/// @description Checks that it is a compile-time error if a statement of the
/// form `return e;` occurs in an asynchronous function whose return type is
/// `void`, `Future<void>`, `FutureOr<void>`, `Future<void>?`, or
/// `FutureOr<void>?` and the static type of `e` is `Future<Object?>` or
/// `Future<Never>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void f1(Future<Object?> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<void> f2(Future<Object?> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<void> f3(Future<Object?> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<void>? f4(Future<Object?> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<void>? f5(Future<Object?> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f6(Future<Never> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<void> f7(Future<Never> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<void> f8(Future<Never> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<void>? f9(Future<Never> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<void>? f10(Future<Never> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
  print(f7);
  print(f8);
  print(f9);
  print(f10);
}
