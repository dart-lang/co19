/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is permitted to invoke or tear-off a method, setter, getter, or
 * operator that is defined on Object on potentially nullable type. The type
 * used for static analysis of such an invocation or tear-off shall be the type
 * declared on the relevant member on Object. For example, given a receiver o of
 * type T?, invoking an Object member on o shall use the type of the member as
 * declared on Object, regardless of the type of the member as declared on T (
 * note that the type as declared on T must be a subtype of the type on Object,
 * and so choosing the Object type is a sound choice. The opposite choice is not
 * sound).
 *
 * @description Checks that it is permitted to invoke or tear-off a method,
 * setter, getter, or operator that is defined on Object on potentially nullable
 * type. The type used for static analysis of such an invocation or tear-off
 * shall be the type declared on the relevant member on Object.
 * @issue 41282
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class T extends Type {}

class C {
  T get runtimeType => new T();
}

main() {
  C c1 = new C();
  T t1 = c1.runtimeType;

  C? c2 = new C();
  T t2 = c2.runtimeType;
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
}
