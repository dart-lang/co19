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
/// It is a compile-time error if `s` is `return e;`, `flatten(S)` is not `void`,
/// `S` is not assignable to `Tv`, and `flatten(S)` is not a subtype of `Tv`.
///
/// @description Checks that it is a compile-time error if a statement of the
/// form `return e;` with `S` as the static type of `e` occurs in an
/// asynchronous function whose future value type is `Tv`, and `flatten(S)` is
/// not `void`, the static type of `e` is not assignable to `Tv`, and
/// `flatten(S)` is not a subtype of `Tv`.
/// @author sgrekhov22@gmail.com

Future<num> f1() async {
  return "42";
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num> f2() async => "42";
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<num> f3() async {
  return Object();
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num> f4() async => Object();
//                        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<num> f5(Future<Object> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num> f6(Future<Object> v) async => v;
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

Future<num>? f7() async {
  return null;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num>? f8() async => null;
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<num>? f9(Future<Null> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num>? f10(Future<Null> v) async => v;
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

Future<num> f11(num? v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num> f12(num? v) async => v;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

Future<num> f13(Future<num?> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num> f14(Future<num?> v) async => v;
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

Future<num> f15(Future<dynamic> v) async {
  return v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<num> f16(Future<dynamic> v) async => v;
//                                          ^
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
  print(f11);
  print(f12);
  print(f13);
  print(f14);
  print(f15);
  print(f16);
}
