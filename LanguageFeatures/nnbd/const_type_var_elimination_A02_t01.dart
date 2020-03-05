/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Note that free type variables which are explicitly used as type
 * arguments in const generic instances are still considered erroneous.
 *
 *   class G<T> {
 *    void foo() {
 *    const List<T> c = <T>[]; // Error
 *    const List<T> d = [];    // The list literal is inferred as <Never>[]
 *    }
 *   }
 *
 * @description Check that compile error is thrown when free type variable is
 * explicity used in the const generic instance.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class G1<T> {
  void foo() {
    const List<T> l1 = <T>[];
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

    const List l2 = <T>[];
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class G2<T extends int> {
  void foo() {
    const List<T> l1 = <T>[];
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

    const List l2 = <T>[];
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  G1().foo();
  G2().foo();
}
