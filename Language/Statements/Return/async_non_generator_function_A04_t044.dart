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
/// @description Checks that it is not an error if a statement of the form
/// `return e;` occurs in an asynchronous function whose return type is
/// not `void` or `Future<void>` and the static type of `e` is assignable to
/// `flatten(T)` and and `flatten(S)` is a subtype of `flatten(T)`.
/// @author sgrekhov22@gmail.com

Future<num> f1() async {
  return 42;
}

Future<num> f2() async => 3.14;


Future<num> f3(Future<int> v) async {
  return v;
}

Future<num> f4(Future<num> v) async => v;

Future<num?> f5() async {
  return null;
}

Future<num?> f6() async => null;

Future<num?> f7(Future<Null> v) async {
  return v;
}

Future<num?> f8(Future<Null> v) async => v;

Future<Null> f9() async {
  return null;
}

Future<Null> f10() async => null;

Future<num> f11() async {
  return throw 42;
}

Future<num> f12() async => throw 42;

Future<num> f13(Future<Never> v) async {
  return v;
}

Future<num> f14(Future<Never> v) async => v;

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
}
