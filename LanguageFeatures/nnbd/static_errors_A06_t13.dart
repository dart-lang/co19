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
 * non-nullable type and no initializer expression. Test some type
 * <X extends Object?>
 * @author sgrekhov@unipro.ru
 * @issue 40677
 * @issue 40940
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C<X extends Object?> {
  X x;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.f(X x) = D<X>;
}

class D<X extends Object?> implements C<X> {
  X x;
  D(this.x);
}

main() {
  new C<String>.f("Lily was here");
}
