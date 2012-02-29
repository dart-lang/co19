/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if evaluation of a constant object results
 * in an uncaught exception being thrown.
 * @description Checks that it is a compile-time error if evaluation of a constant object results
 * in an uncaught exception being thrown.
 * @compile-error
 * @author msyabro
 */

class A {
  const A(var p1, var p2): x = p1 + p2;
  final x;
}

class B {
  const B();
  /*operator+(otherB) {
    return new B();
  }*/
}

var a = const A(const B(), const B());

main() {
  try {
    a;
  } catch(var e) {}
}