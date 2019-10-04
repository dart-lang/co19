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
 * @description Checks that a qualified reference with a prefix to a static
 * constant variable can be used as a constant expression.
 * @author ngl@unipro.ru
 */

import '../../../Utils/expect.dart';
import 'constants_lib.dart' as clib;

const x = '';

const constList = const [
  x,
  clib.C.y,
  clib.yy
];

main() {
  Expect.isTrue(constList is List);
}
