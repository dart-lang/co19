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
/// the static type of `e` is `void`, `Future<void>`, `FutureOr<void>` (cases
/// `Future<void>?` and `FutureOr<void>?` are omitted intentionally because
/// normalization of `void?` to `void` is specified vaguely and it is Ok if
/// tools don't report an errors in these cases).
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

Future<void> f4() async {
  return getVoid();
}

Future<void> f5(Future<void> v) async {
  return v;
}

Future<void> f6(FutureOr<void> v) async {
  return v;
}

FutureOr<void> f7() async {
  return getVoid();
}

FutureOr<void> f8(Future<void> v) async {
  return v;
}

FutureOr<void> f9(FutureOr<void> v) async {
  return v;
}

Future<void>? f10() async {
  return getVoid();
}

Future<void>? f11(Future<void> v) async {
  return v;
}

Future<void>? f12(FutureOr<void> v) async {
  return v;
}

FutureOr<void>? f13() async {
  return getVoid();
}

FutureOr<void>? f14(Future<void> v) async {
  return v;
}

FutureOr<void>? f15(FutureOr<void> v) async {
  return v;
}

main() {
  final future = Future<void>.new(() {});
  f1();
  f2(future);
  f3(future);
  f4();
  f5(future);
  f6(future);
  f7();
  f8(future);
  f9(future);
  f10();
  f11(future);
  f12(future);
  f13();
  f14(future);
  f15(future);
}
