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

class D<T> {}

typedef Alias<T> = void Function(T);

main() {
  Alias a1;
  Alias<A> a2;
  Alias<B> a3;
  Alias<C> a4;
  Alias<Object> a5;
}
