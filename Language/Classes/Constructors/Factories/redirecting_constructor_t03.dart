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
 * @description Checks that parameters list can not occur after another class
 * constructor name
 * @compile-error
 * @author ilya
 */

class A {
  A() {}
  factory A.foo() = C();
}

class C extends A {
}

main() {
  new A.foo();
}
