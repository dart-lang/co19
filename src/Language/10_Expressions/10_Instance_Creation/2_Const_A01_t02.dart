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
 * @description Checks that it is a compile-time error if
 * a constant object expression does not have arguments.
 * @compile-error
 * @author msyabro
 */

class A {
  const A();
}

main() {
  try {
    const A;
  } catch(var e) {}
}