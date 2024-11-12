// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
///
/// Case ⟨Synchronous non-generator functions⟩. Consider the case where `f` is a
/// synchronous non-generator function.
/// ...
/// It is a compile-time error if `s` is `return e;`, `T` is `void`, and `S` is
/// neither `void`, `dynamic`, nor `Null`.
///
/// @description Checks that returning a non-null value with non-dynamic static
/// type from within a `void` method produces a compile error.
/// @author rodionov

void foo() {
  String s = "foo";
  return s;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

void bar() {
  Object? o = null;
  return o;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f() {}

void baz() {
  return f;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  foo();
  bar();
  baz();
}
