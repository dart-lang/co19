/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a mixin declaration or a class declaration with
 * no generative constructors declares an instance variable with a potentially
 * non-nullable type and no initializer expression unless the variable is marked
 * with the late modifier.
 *
 * @description Check that it is an error if a mixin declaration with no
 * generative constructors declares an instance variable with a potentially
 * non-nullable type and no initializer expression. Test some class X
 * @author sgrekhov@unipro.ru
 * @issue 40940
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A {}
class X {}

mixin M on A {
  X x;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C extends A with M {
}

main() {
  new C();
}
