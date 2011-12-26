/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an instance variable declaration has one of the forms T v = e;,
 * var v = e;, final T v = e; or final v = e; then the expression e 
 * must be a compile-time constant (10.1).
 * @description Checks that it is a compile error if an instance variable is declared
 * in the form T v = e; and e is not a compile-time constant.
 * @compile-error
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */

class C {
  Object foo = new Object();
}

main() {
  try {
    new C().foo;
  } catch(var x){}
}
