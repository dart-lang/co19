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
 * @description Checks that an expression of the form e.length cannot be used
 * to initialize a constant variable if e isn't constant expression.
 * @compile-error
 * @issue #24940
 * @author ngl@unipro.ru
 */

import '../../../Utils/expect.dart';

String m = "abc";
const l = m.length;

main() {
  Expect.isTrue(l is int);
}
