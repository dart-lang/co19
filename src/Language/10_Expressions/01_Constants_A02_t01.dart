/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A literal boolean (10.4) is a constant expression.
 * @description Checks that various literal booleans can be assigned to a static final variable
 * and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final i1 = true;
final i2 = false;

main() {
  Expect.isTrue(i1);
  Expect.isFalse(i2);
}
