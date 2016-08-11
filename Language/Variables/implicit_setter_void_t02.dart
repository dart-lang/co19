/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final variable declaration of the form T v;
 * or the form T v = e; always induces an implicit setter function 
 * with signature
 *   void set v = (T x)
 * whose execution sets the value of v to the incoming argument x.
 * @description Checks that a compile error is produced when assigning a value
 * of type that may not be assigned to T, to the variable declared as T v;.
 * @compile-error
 * @author pagolubev
 */
import "../../Utils/dynamic_check.dart";

class A {
  int v;
}

main() {
  A a = new A();
  a.v = false;
}
