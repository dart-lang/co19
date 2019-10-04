/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant expression is an expression whose value can never
 * change, and that can be evaluated entirely at compile time.
 * A constant expression is one of the following:
 * . . .
 * • A qualified reference to a static constant variable that is not qualified
 *   by a deferred prefix.
 * @description Checks that a reference to a static constant variable can be an
 * elementof a constant list literal and is, therefore, a constant expression.
 * @author iefremov
 * @reviewer rodionov
 */

import '../../../Utils/expect.dart';

const x = '';

class C {
  static const bool y = false;
}

const constList = const [
  x,
  C.y
];

main() {
  Expect.isTrue(constList is List);
}
