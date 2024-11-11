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
/// @description Checks that returning a `null` or a value with the static type
/// `dynamic` from within a `void` method does not result in a warning or error.
/// @author rodionov

void foo() {
  return null;
}

void bar(var v) {
  return v;
}

main() {
  foo();
  bar(1);
}
