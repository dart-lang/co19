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
 * before it is definitely assigned. Test if (v != null)...
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C {
  static void test(var v) {
    if (v != null) {
      v.toString();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  void test2(var v) {
    if (v != null) {
      v.toString();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  Function foo = (var v) {
    if (v != null) {
      v.toString();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  };
  C.test(42);
  new C().test2(42);
}
