/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant object expression invokes a constant constructor.
 * constObjectExpression:
 *   const type ('.' identifier)? arguments
 * ;
 * @description Checks that it is a compile-time error if the identifier of a
 * named constructor in a constant object expression is empty.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  const A.name();
}

main() {
  try {
    const A.();
  } catch (e) {}
}
