/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is assignable to a type S if T is dynamic, or if T is a
 * subtype of S.
 *
 * @description Checks that if type T is not dynamic and T is a subtype of S
 * then a type T is not assignable to a type S. Test type aliases
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";
class A {}
class B extends A {}
class C extends A {}

typedef AAlias = A;
typedef BAlias = B;
typedef CAlias = C;

main() {
  BAlias b1 = new A();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  BAlias b2 = new C();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  BAlias? b3 = new A();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  BAlias? b4 = new C();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
