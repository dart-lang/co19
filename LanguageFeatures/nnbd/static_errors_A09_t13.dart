/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the body of a method, function, getter, or
 * function expression with a potentially non-nullable return type may complete
 * normally.
 *
 * @description It is an error if the body of a method, function, getter, or
 * function expression with a potentially non-nullable return type may complete
 * normally. Test FutureOr<T> where <T extends Object>
 * @author sgrekhov@unipro.ru
 * @issue 40396
 * @issue 40948
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";

class A {}

class C<T extends Object> {

  FutureOr<T> mTest() {}
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<T> get gTest {}
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<T> test<T extends Object>() {}
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C<A> c = new C<A>();
  c.mTest();
  c.gTest;
  test();
}
