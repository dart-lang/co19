/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The name of a setter is obtained by appending the string ‘=’ 
 * to the identifier given in its signature. Hence, a setter name can never
 * conflict with, override or be overridden by a getter or method.
 * @description Checks that there is no compile-time error if a class has 
 * an explicitly defined abstract setter and an instance method inherited from
 * a superclass with the same name.
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 * @issue 5840
 */
import "../../Utils/expect.dart";

class A {
  foo(value) {}
}

class C extends A { /// static type warning Abstract Instance Members: It is a static warning if an abstract member is declared or inherited in a concrete class.
  void set foo(var x);
}

main() {
  C c=new C();
  c.foo(1);
  try {
    c.foo=1;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
}
