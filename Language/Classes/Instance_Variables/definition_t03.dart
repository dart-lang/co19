/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Instance variables are variables whose declarations are
 * immediately contained within a class declaration and that are not declared
 * static. The instance variables of a class C are those instance variables
 * declared by C and the instance variables inherited by C from its superclass.
 * @description Checks that class instance variables are those not declared as
 * static. It's compile error to call static variables as instance ones
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class A {
  int v1 = 1;
  static int s1 = 10;
}

class C extends A {
  int v2 = 2;
  static int s2 = 20;
}

main() {
  C c = new C();
  c.s1;
  c.s2;
}
