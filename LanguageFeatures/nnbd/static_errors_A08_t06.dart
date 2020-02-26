/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a potentially non-nullable local variable which
 * has no initializer expression and is not marked late is used before it is
 * definitely assigned
 *
 * @description Check that it is an error if a potentially non-nullable local
 * variable which has no initializer expression and is not marked late is used
 * before it is definitely assigned. Test some type <X extends Object>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C<X extends Object> {
  void test() {
    X x;
    x.toString();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void foo<X extends Object>() {
  X x;
  x.toString();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C<String>().test();
  foo<String>();
}
