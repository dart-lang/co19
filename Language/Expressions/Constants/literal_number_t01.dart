// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// • A literal number.
/// @description Checks that 0xFFffFFffFFffFFff can be elements of a
/// constant list literal and шы, therefore, constant expressions. Minus sign
/// is not a part of a number literal so those are not included in this test.
/// Should be excluded for the web runs as 0xFFffFFffFFffFFff is not allowed as
/// a literal number there.
/// @author iefremov

import '../../../Utils/expect.dart';

final constList = const [
  0xFFffFFffFFffFFff
];

main() {
  checkType(checkIs<List>, true, constList);
}
