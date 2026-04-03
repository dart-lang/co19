// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
/// ...
/// Case ⟨Asynchronous non-generator functions⟩. Consider the case where `f` is
/// an asynchronous non-generator function.
/// ...
/// It is a compile-time error if `s` is `return e;`, `flatten(S)` is not `void`,
/// and `S` is not assignable to `flatten(T)`, and `flatten(S)` is not a subtype
/// of `flatten(T)`.
///
/// @description Checks that it is a compile-time error if a statement of the
/// form `return e;` occurs in an asynchronous function whose return type is
/// not `void` or `Future<void>` and the static type of `e` is not assignable to
/// `flatten(T)`, and `flatten(S)` is not a subtype of `flatten(T)`.
/// @author sgrekhov22@gmail.com

Future<Null> f1(int? v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f2(int? v) async => v;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

Future<Null> f3(Future<dynamic> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f4(Future<dynamic> v) async => v;
//                                          ^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f5() async {
  return 42;
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f6() async => 42;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f7() async {
  return null;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f8() async => null;
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f9(Future<dynamic> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f10(Future<dynamic> v) async => v;
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified

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
