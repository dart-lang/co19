// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A constant list literal.
/// @description Checks that a non-constant list literal cannot be assigned to
/// a constant variable.
/// @author iefremov
/// @reviewer rodionov


var nonconstant = [1, 2, 3];
const a = nonconstant;
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    print(a);
  } catch (x) {}
}
