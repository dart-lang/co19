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
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {}
class B extends A {}
class C extends B {}

class D<T> {}

typedef Alias<T> = D<T>;

main() {
  D d1 = Alias();
  D d2 = Alias<A>();
  D d3 = Alias<B>();
  D d4 = Alias<C>();
  D d5 = Alias<Object>();
}
