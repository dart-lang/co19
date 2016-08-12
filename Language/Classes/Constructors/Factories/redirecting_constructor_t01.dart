/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A redirecting factory constructor specifies a call to a
 * constructor of another class that is to be used whenever the redirecting
 * constructor is called.
 * redirectingFactoryConstructorSignature:
 *   const? factory identifier (‘.’ identifier)? formalParameterList
 * ‘=’ typeName (‘.’ identifier)?
 * ;
 * @description Checks that correct declarations of redirecting factory
 * constructors do not cause errors.
 * @author kaigorodov
 */
import "../../../../Utils/expect.dart";

class A {
  A() {}
  factory A.foo() = C.bar;
  int m() {}
}

class C extends A {
  C() {}
  factory C.bar() = D;
  int m() { return 1; }
}

class D extends C {
  int m() { return 2; }
}

main() {
  A a = new A.foo();
  Expect.equals(2, a.m());
}
