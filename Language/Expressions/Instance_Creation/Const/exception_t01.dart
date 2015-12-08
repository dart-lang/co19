/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if evaluation of a constant object
 * results in an uncaught exception being thrown.
 * @description Checks that it is a compile-time error if evaluation of a
 * constant object results in an uncaught exception being thrown.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  const A(): x = 1 ~/ 0; // IntegerDivisionByZeroException
  final x;
}

const a = const A();

main() {
  try {
    a;
  } catch (e) {}
}
