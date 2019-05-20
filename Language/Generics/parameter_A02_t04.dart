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

typedef Alias<T>(T t);

testme(a) {}

main() {
  Alias a1 = testme;
  Alias<A> a2 = testme;
  Alias<B> a3 = testme;
  Alias<C> a4 = testme;
  Alias<Object> a5 = testme;
}
