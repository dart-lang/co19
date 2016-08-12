/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  When invoked from a constant object expression, a constant
 * constructor must throw an exception if any of its actual parameters is a
 * value that would prevent one of the potentially constant expressions within
 * it from being a valid compile-time constant.
 * @description Checks that compile-time error is produced if actual parameters
 * passed to the constructor make the constant initializer invalid. Note: this
 * mechanism is described in chapter Classes.Constructors.Constant_Constructors.
 * Constant constructor invocation is placed outside of main(), in a global
 * variable initialization expression.
 * @compile-error
 * @author iefremov
 */

class A {
  final x;
  const A(var p) : x = p + 42;
}

var a = const A(new DateTime.now().millisecondsSinceEpoch);

main() {
  try {
    var b = a;
  } catch (x) {}
}
