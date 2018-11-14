/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The name of a setter is obtained by appending the string ‘=’
 * to the identifier given in its signature. Hence, a setter name can never
 * conflict with, override or be overridden by a getter or method.
 * @description Checks that there is a compile-time error if a class has
 * an explicitly defined abstract setter and an instance method inherited from
 * a superclass with the same name.
 * @compile-error
 * @author iefremov
 */

class A {
  foo(value) {}
}

class C extends A {
  void set foo(var x);
}

main() {
  C c = new C();
  c.foo(1);
  c.foo = 1;
}
