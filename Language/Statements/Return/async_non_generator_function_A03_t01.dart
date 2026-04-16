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
/// `Object?`, `Future<Object?>`, `FutureOr<Object?>`, `Future<Object?>?`, or
/// `FutureOr<Object?>?` and the static type of `e` is `void`, `Future<void>`,
/// `FutureOr<void>`, `Future<void>?`, or `FutureOr<void>?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void getVoid() {}
final Future<void> futureVoid = Future<void>.new(() {});
final FutureOr<void> futureOrVoid = futureVoid;
final Future<void>? nFutureVoid = 2 > 1 ? futureVoid : null;
final FutureOr<void>? nFutureOrVoid = 2 > 1 ? futureVoid : null;

Object? f1() async { // ignore: body_might_complete_normally_nullable
  if (1 > 2) {
    return getVoid();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureVoid;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureOrVoid;
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureVoid;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureOrVoid;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Future<Object?> f2() async { // ignore: body_might_complete_normally_nullable
  if (1 > 2) {
    return getVoid();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureVoid;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureOrVoid;
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureVoid;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureOrVoid;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

FutureOr<Object?> f3() async { // ignore: body_might_complete_normally_nullable
  if (1 > 2) {
    return getVoid();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureVoid;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureOrVoid;
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureVoid;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureOrVoid;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Future<Object?>? f4() async { // ignore: body_might_complete_normally_nullable
  if (1 > 2) {
    return getVoid();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureVoid;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureOrVoid;
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureVoid;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureOrVoid;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

FutureOr<Object?>? f5() async { // ignore: body_might_complete_normally_nullable
  if (1 > 2) {
    return getVoid();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureVoid;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return futureOrVoid;
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureVoid;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return nFutureOrVoid;
//         ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}


main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
}
