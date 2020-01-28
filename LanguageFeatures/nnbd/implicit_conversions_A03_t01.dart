/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Implicit tear-off conversion is not performed on objects of
 * nullable type, regardless of the context type.
 *
 * @description Check that the implicit tear-off conversion is not performed on
 * objects of nullable type, regardless of the context type.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

typedef int Foo();

class C {
  int call() => 42;
}

main() {
  C? c = new C();
  Function f = c;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  Foo f2 = c;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  test1(c);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  test2(c);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test1(Foo f) {}

test2(Foo? f) {}
