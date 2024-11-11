// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - In a return statement `return e;`, `e` may have type `void` in a number of
///   situations.
///
/// @description Checks that returning a non-null value with non-dynamic static
/// type from within a `void` method produces compile error.
/// @author rodionov

void foo() {
  String s = "foo";
  return s;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

void bar() {
  Object? o = (1 > 2) ? Object() : null;
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
