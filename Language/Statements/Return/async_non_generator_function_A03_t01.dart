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
/// It is a compile-time error if `s` is `return e;`, `Tv` is neither `void` nor
/// `dynamic`, and `flatten(S)` is `void`.
///
/// @description Checks that it is a compile-time error if a statement of the
/// form `return e;` occurs in an asynchronous function whose return type is
/// not `void`, `Future<void>`, `dynamic` or `Future<dynamic>` and the static
/// type of `e` is `void`, `Future<void>`, `FutureOr<void>`, `Future<void>?`, or
/// `FutureOr<void>?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void getVoid() {}
final Future<void> futureVoid = Future<void>.new(() {});
final FutureOr<void> futureOrVoid = futureVoid;
final Future<void>? nFutureVoid = 2 > 1 ? futureVoid : null;
final FutureOr<void>? nFutureOrVoid = 2 > 1 ? futureVoid : null;

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

Future<Object?> f3() async {
  return futureVoid;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Object?> f4() async => futureVoid;
//                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Object?> f5() async {
  return futureOrVoid;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Object?> f6() async => futureOrVoid;
//                            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Object?> f7() async {
  return nFutureVoid;
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Object?> f8() async => nFutureVoid;
//                            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Object?> f9() async {
  return nFutureOrVoid;
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Object?> f10() async => nFutureOtVoid;
//                             ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Null> f11() async {
  return getVoid();
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f12() async => getVoid();
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Null> f13() async {
  return futureVoid;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f14() async => futureVoid;
//                          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Null> f15() async {
  return futureOrVoid;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f16() async => futureOrVoid;
//                          ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Null> f17() async {
  return nFutureVoid;
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f18() async => nFutureVoid;
//                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Null> f19() async {
  return nFutureOrVoid;
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Null> f20() async => nFutureOtVoid;
//                          ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f21() async {
  return getVoid();
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f22() async => getVoid();
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f23() async {
  return futureVoid;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f24() async => futureVoid;
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f25() async {
  return futureOrVoid;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f26() async => futureOrVoid;
//                           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f27() async {
  return nFutureVoid;
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f28() async => nFutureVoid;
//                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Future<Never> f29() async {
  return nFutureOrVoid;
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Never> f30() async => nFutureOtVoid;
//                           ^^^^^^^^^^^^^
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
  print(f17);
  print(f18);
  print(f19);
  print(f20);
  print(f21);
  print(f22);
  print(f23);
  print(f24);
  print(f25);
  print(f26);
  print(f27);
  print(f28);
  print(f29);
  print(f30);
}
