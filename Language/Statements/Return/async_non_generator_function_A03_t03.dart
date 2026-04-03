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
/// @description Checks that it is not an error if a statement of the form
/// `return e;` occurs in an asynchronous function whose return type is `void`
/// or `Future<void>` and static type of `e` is `void` or `Future<void>`.
/// @author sgrekhov22@gmail.com

void getVoid() {}
Future<void> getFutureVoid() async {}

void f1() async {
  return getVoid();
}

Future<void> f2() async {
  return getVoid();
}

void f3() async {
  return getFutureVoid();
}

Future<void> f4() async {
  return getFutureVoid();
}

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
}
