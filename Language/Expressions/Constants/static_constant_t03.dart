// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A qualified reference to a static constant variable that is not qualified
///   by a deferred prefix.
/// @description Checks that a reference to a static final variable cannot be
/// assigned to a constant variable.
/// @author msyabro


class A {
  static final x = 1;
}

const i1 = x;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    print(i1);
  } catch (x) {}
}
