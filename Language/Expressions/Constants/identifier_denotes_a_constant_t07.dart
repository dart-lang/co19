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
 * @description Checks that a qualified identifier that denotes a type alias
 * accessed via a deferred prefix is not a constant expression.
 * @compile-error
 * @author ngl@unipo.ru
 */

import '../lib.dart' deferred as prefix;

const b = prefix.B; // type alias

main() {
  b;
}
