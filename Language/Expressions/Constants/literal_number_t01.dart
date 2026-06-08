// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All usages of ’constant’ in Dart are associated with compile time.
/// A potentially constant expression is an expression that will generally yield
/// a constant value when the values of certain parameters are given. The
/// constant expressions is a subset of the potentially constant expressions
/// that can be evaluated at compile time.
///
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// • A literal number is a potentially constant and constant expression if it
///   evaluates to an instance of type `int` or `double`.
///
/// @description Checks that `0xFFffFFffFFffFFff` can be elements of a
/// constant list literal and is, therefore, a constant expressions. Minus sign
/// is not a part of a number literal so those are not included in this test.
/// Should be excluded for the web runs as `0xFFffFFffFFffFFff` is not allowed
/// as a literal number there.
/// @author iefremov

const c = 0xFFffFFffFFffFFff;

main() {
  print(c);
}
