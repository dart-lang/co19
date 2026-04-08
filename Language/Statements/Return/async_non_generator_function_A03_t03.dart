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
/// `return e;` occurs in an asynchronous function whose return type is `void`,
/// `Future<void>`, `FutureOr<void>`, `Future<void>?`, or `FutureOr<void>?` and
/// the static type of `e` is `void`, `Future<void>`, `FutureOr<void>`,
/// `Future<void>?`, or `FutureOr<void>?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void getVoid() {}
final Future<void> futureVoid = Future<void>.new(() {});
final FutureOr<void> futureOrVoid = futureVoid;
final Future<void>? nFutureVoid = 2 > 1 ? futureVoid : null;
final FutureOr<void>? nFutureOrVoid = 2 > 1 ? futureVoid : null;

void f1() async {
  return getVoid();
}

void f2() async {
  return futureVoid;
}

void f3() async {
  return futureOrVoid;
}

void f4() async {
  return nFutureVoid;
}

void f5() async {
  return nFutureOrVoid;
}

Future<void> f6() async {
  return getVoid();
}

Future<void> f7() async {
  return futureVoid;
}

Future<void> f8() async {
  return futureOrVoid;
}

Future<void> f9() async {
  return nFutureVoid;
}

Future<void> f10() async {
  return nFutureOrVoid;
}

FutureOr<void> f11() async {
  return getVoid();
}

FutureOr<void> f12() async {
  return futureVoid;
}

FutureOr<void> f13() async {
  return futureOrVoid;
}

FutureOr<void> f14() async {
  return nFutureVoid;
}

FutureOr<void> f15() async {
  return nFutureOrVoid;
}

Future<void>? f16() async {
  return getVoid();
}

Future<void>? f17() async {
  return futureVoid;
}

Future<void>? f18() async {
  return futureOrVoid;
}

Future<void>? f19() async {
  return nFutureVoid;
}

Future<void>? f20() async {
  return nFutureOrVoid;
}

FutureOr<void>? f21() async {
  return getVoid();
}

FutureOr<void>? f22() async {
  return futureVoid;
}

FutureOr<void>? f23() async {
  return futureOrVoid;
}

FutureOr<void>? f24() async {
  return nFutureVoid;
}

FutureOr<void>? f25() async {
  return nFutureOrVoid;
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
  f16();
  f17();
  f18();
  f19();
  f20();
  f21();
  f22();
  f23();
  f24();
  f25();
}
