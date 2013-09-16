/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The superinitializer that appears, explicitly or implicitly,
 * in the initializer list of a constant constructor must specify a constant
 * constructor of the superclass of the immediately enclosing class or a
 * compile-time error occurs.
 * @description Checks that compile error is produced if implicit
 * superinitializer is a call to non const constructor
 * @compile-error
 * @author ilya
 */

class C {
  C();
}

class A extends C {
  const A();
}

main() {
  try {
    var a = const A();
  } catch (x) {}
}
