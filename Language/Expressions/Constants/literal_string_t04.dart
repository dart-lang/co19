// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A literal string where any interpolated expression is a compile-time
///   constant that evaluates to a numeric, string or boolean value or to null.
/// @description Checks that a string literal that involves string interpolation,
/// that evaluates to a bool value and is a constant expression can be assigned
/// to a constant variable.
/// @author msyabro

import "../../../Utils/expect.dart";

const i1 = "${1 is int}";
const i2 = "${1 is String}";

main() {
  Expect.equals("true", i1);
  Expect.equals("false", i2);
}
