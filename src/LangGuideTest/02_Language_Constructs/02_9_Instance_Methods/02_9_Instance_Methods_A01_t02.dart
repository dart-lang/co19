/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Instance methods may only be called on instances.
 * @description checks that instance method can not be called without an object
 * @author pagolubev
 * @reviewer iefremov
 * @compile-error
 */

class A {
  void f() {}
}


main() {
  A.f();
}
