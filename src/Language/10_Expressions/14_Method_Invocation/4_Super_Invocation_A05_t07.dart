/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a super method invocation occurs in a top-level
 * function or variable initializer, in class Object, in a factory constructor, in an instance 
 * variable initializer, a constructor initializer or in a static method or variable initializer.
 * @description Checks that it is a compile-time error if a super method invocation occurs 
 * in a factory constructor.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

interface I default C {
  I.foo();
}

class A {
   C make() {
     return new C();
   }
}

class C extends A {
  C() {}
  factory I.foo() {return super.make();}
}

main() {
  try {
    new I.foo();
  } catch(var x){}
}
