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
/// @description Checks that it is not an error if a statement of the form
/// `return e;` occurs in an asynchronous function whose return type is
/// `dynamic`, `Future<dynamic>`, `FutureOr<dynamic>`, `Future<dynamic>?`, or
/// `FutureOr<dynamic>?` and the static type of `e` is `void`, `Future<void>`,
/// `FutureOr<void>` (cases `Future<void>?` and `FutureOr<void>?` are omitted
/// intentionally because we don't want to test `void?` to `void` normalization
/// here).
/// @author sgrekhov22@gmail.com

import 'dart:async';

void getVoid() {}
final Future<void> futureVoid = Future<void>.new(() {});
final FutureOr<void> futureOrVoid = futureVoid;

dynamic f1() async {
  return getVoid();
}

dynamic f2() async {
  return futureVoid;
}

dynamic f3() async {
  return futureOrVoid;
}

Future<dynamic> f4() async {
  return getVoid();
}

Future<dynamic> f5() async {
  return futureVoid;
}

Future<dynamic> f6() async {
  return futureOrVoid;
}

FutureOr<dynamic> f7() async {
  return getVoid();
}

FutureOr<dynamic> f8() async {
  return futureVoid;
}

FutureOr<dynamic> f9() async {
  return futureOrVoid;
}

Future<dynamic>? f10() async {
  return getVoid();
}

Future<dynamic>? f11() async {
  return futureVoid;
}

Future<dynamic>? f12() async {
  return futureOrVoid;
}

FutureOr<dynamic>? f13() async {
  return getVoid();
}

FutureOr<dynamic>? f14() async {
  return futureVoid;
}

FutureOr<dynamic>? f15() async {
  return futureOrVoid;
}

main() {
  f1();
  f2();
  f3();
  f4();
  f5();
  f6();
  f7();
  f8();
  f9();
  f10();
  f11();
  f12();
  f13();
  f14();
  f15();
}
