/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A literal number (10.3) is a constant expression.
 * @description Checks that a function is not a constant expression.
 * @compile-error
 * @author kaigorodov
 * @reviewer msyabro
 */

final constList = const [main]; //a constant list can contain only constant expressions

main() {
  try {
    Expect.isTrue(constList is List);
  } catch(var x) {}
}
