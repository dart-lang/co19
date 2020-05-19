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
 * • An identifier expression that denotes a constant variable.
 * • A simple or qualified identifier denoting a class or a type alias that is
 *   not qualified by a deferred prefix.
 * @description Checks that an identifier expression that denotes a class
 * can be assigned to a constant variable.
 * @author kaigorodov
 */

import '../../../Utils/expect.dart';

class C {}

const a = String;
const b = int;
const c = List;
const c2 = Map;
const d = C;

main() {
  Expect.isTrue(a is Type);
  Expect.isTrue(b is Type);
  Expect.isTrue(c is Type);
  Expect.isTrue(c2 is Type);
  Expect.isTrue(d is Type);
}
