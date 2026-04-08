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
/// @description Checks that it is not an error if a statement of the form
/// `return e;` occurs in an asynchronous function whose return type is `void`,
/// `Future<void>`, `FutureOr<void>`, `Future<void>?`, or `FutureOr<void>?` and
/// the static type of `e` is `void`, `Future<void>`, `FutureOr<void>`,
/// `Future<void>?`, or `FutureOr<void>?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void getVoid() {}

void f1() async {
  return getVoid();
}

void f2(Future<void> v) async {
  return v;
}

void f3(FutureOr<void> v) async {
  return v;
}

void f4(Future<void>? v) async {
  return v;
}

void f5(FutureOr<void>? v) async {
  return v;
}

Future<void> f6() async {
  return getVoid();
}

Future<void> f7(Future<void> v) async {
  return v;
}

Future<void> f8(FutureOr<void> v) async {
  return v;
}

Future<void> f9(Future<void>? v) async {
  return v;
}

Future<void> f10(FutureOr<void>? v) async {
  return v;
}

FutureOr<void> f11() async {
  return getVoid();
}

FutureOr<void> f12(Future<void> v) async {
  return v;
}

FutureOr<void> f13(FutureOr<void> v) async {
  return v;
}

FutureOr<void> f14(Future<void>? v) async {
  return v;
}

FutureOr<void> f15(FutureOr<void>? v) async {
  return v;
}

Future<void>? f16() async {
  return getVoid();
}

Future<void>? f17(Future<void> v) async {
  return v;
}

Future<void>? f18(FutureOr<void> v) async {
  return v;
}

Future<void>? f19(Future<void>? v) async {
  return v;
}

Future<void>? f20(FutureOr<void>? v) async {
  return v;
}

FutureOr<void>? f21() async {
  return getVoid();
}

FutureOr<void>? f22(Future<void> v) async {
  return v;
}

FutureOr<void>? f23(FutureOr<void> v) async {
  return v;
}

FutureOr<void>? f24(Future<void>? v) async {
  return v;
}

FutureOr<void>? f25(FutureOr<void>? v) async {
  return v;
}


main() {
  final future = Future<void>.new(() {});
  f1();
  f2(future);
  f3(future);
  f4(future);
  f5(future);
  f6();
  f7(future);
  f8(future);
  f9(future);
  f10(future);
  f11();
  f12(future);
  f13(future);
  f14(future);
  f15(future);
  f16();
  f17(future);
  f18(future);
  f19(future);
  f20(future);
  f21();
  f22(future);
  f23(future);
  f24(future);
  f25(future);
}
