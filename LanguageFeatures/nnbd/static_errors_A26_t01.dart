/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the type of the value returned from a factory
 * constructor is not a subtype of the class type associated with the class in
 * which it is defined (specifically, it is an error to return a nullable type
 * from a factory constructor for any class other than Null).
 *
 * @description Check that it is an error to return a nullable type from a
 * factory constructor for any class other than Null
 * @author sgrekhov@unipro.ru
 * @issue 39712
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {
  A() {}

  factory A.factoryA() {
    C? c = new C();
    return c;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class C extends A {
}

main() {
  A a = new A.factoryA();
}
