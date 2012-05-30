/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A factory is a constructor prefaced by the built-in identifier factory.
 * factoryConstructorSignature:
 *   factory qualified ('.' identifier)? formalParameterList
 * ;
 * @description Checks that it is a compile-time error if a factory constructor contains "super" expression.
 * @compile-error
 * @author kaigorodov
 */

class A {
   static C make() {
     return new C();
   }
}
class C extends A {
  C(){}
  factory C.a() { return super.make(); }
}

main() {
  try {
    new C.a();
  } catch(var x){}
}