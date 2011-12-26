/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final instance variable declaration of the form T v;
 * or the form T v = e; always induces an implicit setter function (7.3) 
 * with signature void set v(T x) whose execution sets the value of v 
 * to the incoming argument x.
 * @description Checks that a static warning is produced when assigning a value
 * of type that may not be assigned to T, to the variable declared as T v = e;.
 * @author pagolubev
 * @reviewer iefremov
 * @reviewer rodionov
 * @static-type-error
 */

class A {
  int v = 42;
}

main() {
  A a = new A();
  try {
    a.v = false;
  } catch(TypeError ok) {}
}
