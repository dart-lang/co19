// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - In an arrow function body `=> e`, the returned expression `e` may have
/// type `void` in a number of situations.
///
/// @description Checks that in arrow function body `=> e`, the returned
/// expression `e` may have type `void`.
/// @author sgrekhov22@gmail.com

void e = 0;

void foo() => e;

void bar() async => e;

main() {
  foo();
  bar();
}
