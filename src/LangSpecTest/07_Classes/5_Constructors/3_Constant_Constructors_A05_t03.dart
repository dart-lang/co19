/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When invoked from a constant object expression, a constant constructor
 * must throw an exception if any of its actual parameters would be a value that
 * would cause one of the potentially constant expressions within it to not be a valid compile-time constant.
 * @description Checks that compile-time error is produced if actual parameters passed to the constructor
 * make the constant initializer invalid. Note: this mechanism is described in 10.10.2
 * Constant constructor invocation is placed outside of main(), in a global variable initialization expression.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class A {
  final x;
  const A(var p) : x = p + 42;
}

var a = const A(const [1]);

main() {
  try {
    var b = a;
  } catch(var x){}
}