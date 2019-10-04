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
 * • An expression of the form e.length where e is a constant expression that
 *   evaluates to a string value.
 * @description Checks that an expression of the form e.length can be used to
 * initialize a constant variable if a constant expression e is evaluated to
 * string.
 * @author ngl@unipro.ru
 */

import '../../../Utils/expect.dart';

const String m = "ab" + "c";
const l0 = 'q'.length;
const l1 = "ab".length;
const l2 = m.length;
const l3 = ("ab" + "cd").length;
const l4 = (m + "12").length;

main() {
  Expect.isTrue(l0 == 1);
  Expect.isTrue(l1 == 2);
  Expect.isTrue(l2 == 3);
  Expect.isTrue(l3 == 4);
  Expect.isTrue(l4 == 5);
}
