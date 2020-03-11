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
 * non-nullable type and no initializer expression. Test some type
 * <T extends Object>
 * @author sgrekhov@unipro.ru
 * @issue 40940
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class X {}

mixin M<T extends Object> on X {
  T t;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C extends X with M<String> {
}

main() {
  new C();
}
