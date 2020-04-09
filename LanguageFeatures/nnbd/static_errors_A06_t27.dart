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
 * @description Check that it is an error if a class declaration with no
 * generative constructors declares an instance variable with a potentially
 * non-nullable type and no initializer expression. Test F*, where F is a
 * function type
 * @author sgrekhov@unipro.ru
 * @issue 40677
 * @issue 40940
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

class C {
  LegacyFoo f;
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  factory C.f() = D;
}

class D implements C {
  LegacyFoo f = legacyFoo;

  D();
}

main() {
  new C.f();
}
