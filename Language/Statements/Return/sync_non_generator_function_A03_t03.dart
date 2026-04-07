// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
///
/// Case ⟨Synchronous non-generator functions⟩. Consider the case where `f` is a
/// synchronous non-generator function.
/// ...
/// It is a compile-time error if `s` is `return e;`, `T` is neither
/// `void` nor `dynamic`, and `S` is `void`.
///
/// @description Check that it is a compile-time error to return an expression
/// of type `void` from a function whose return type is `Object?`.
/// @author sgrekhov22@gmail.com

void g() {}

Object? foo() {
  return g();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

Object? bar() => g();
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(foo);
  print(bar);
}
