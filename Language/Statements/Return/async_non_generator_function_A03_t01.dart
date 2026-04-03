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
/// It is a compile-time error if `s` is `return e;`, `flatten(T)` is neither
/// `void` nor `dynamic`, and `flatten(S)` is `void`.
///
/// @description Checks that it is a compile-time error if a statement of the
/// form `return e;` occurs in an asynchronous function whose return type is
/// not `void`, `Future<void>`, `dynamic` or `Future<dynamic>` and the static
/// type of `e` is `void`.
/// @author sgrekhov22@gmail.com

void getVoid() {}

Future<Object?> f1() async {
  return getVoid();
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Object?> f2() async => getVoid();
//                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Null> f3() async {
  return getVoid();
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f4() async => getVoid();
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f5() async {
  return getVoid();
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f6() async => getVoid();
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
}
