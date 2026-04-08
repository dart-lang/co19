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
/// the static type of `e` is `Null`, `Future<Null>`, `FutureOr<Null>`,
/// `Future<Null>?`, or `FutureOr<Null>?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void f1() async {
  return null;
}

void f2(Future<Null> v) async {
  return v;
}

void f3(FutureOr<Null> v) async {
  return v;
}

void f4(Future<Null>? v) async {
  return v;
}

void f5(FutureOr<Null>? v) async {
  return v;
}

Future<void> f6() async {
  return null;
}

Future<void> f7(Future<Null> v) async {
  return v;
}

Future<void> f8(FutureOr<Null> v) async {
  return v;
}

Future<void> f9(Future<Null>? v) async {
  return v;
}

Future<void> f10(FutureOr<Null>? v) async {
  return v;
}

FutureOr<void> f11() async {
  return null;
}

FutureOr<void> f12(Future<Null> v) async {
  return v;
}

FutureOr<void> f13(FutureOr<Null> v) async {
  return v;
}

FutureOr<void> f14(Future<Null>? v) async {
  return v;
}

FutureOr<void> f15(FutureOr<Null>? v) async {
  return v;
}

Future<void>? f16() async {
  return null;
}

Future<void>? f17(Future<Null> v) async {
  return v;
}

Future<void>? f18(FutureOr<Null> v) async {
  return v;
}

Future<void>? f19(Future<Null>? v) async {
  return v;
}

Future<void>? f20(FutureOr<Null>? v) async {
  return v;
}

FutureOr<void>? f21() async {
  return null;
}

FutureOr<void>? f22(Future<Null> v) async {
  return v;
}

FutureOr<void>? f23(FutureOr<Null> v) async {
  return v;
}

FutureOr<void>? f24(Future<Null>? v) async {
  return v;
}

FutureOr<void>? f25(FutureOr<Null>? v) async {
  return v;
}

main() {
  final future = Future<Null>.value(null);
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
