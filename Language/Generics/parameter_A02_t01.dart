/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *    typeParameter ::= metadata identifier (extends typeNotVoid)?
 *    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
 * ...
 * If no extends clause is present, the upper bound is Object.
 * @description Checks that the upper bound is [Object] if [extends] clause is
 * absent.
 * @author iarkh@unipro.ru
 */

class A {} 
class B extends A {}
class C extends B {}

class C1<T> {}

main() {
  C1 c11 = C1();
  C1 c12 = C1<A>();
  C1 c13 = C1<B>();
  C1 c14 = C1<C>();
  C1 c15 = C1<Object>();
}
