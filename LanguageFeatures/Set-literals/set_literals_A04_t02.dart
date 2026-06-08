// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of s is Set<T>.
///
/// @description Checks that the static type of s is Set<T>.
/// @author sgrekhov@unipro.ru

import "dart:collection";

class C {}

main() {
  LinkedHashSet<int> test1() => <int>{};
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<int> test2() => const <int>{};
//                              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<int> test3() => <int>{1, 2};
//                              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<int> test4() => {1, 2};
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<int> test5() => const <int>{1, 2};
//                              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LinkedHashSet test6()  => <int>{};
//                          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet test7()  => const <int>{};
//                          ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet test8()  => <int>{1, 2};
//                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet test9()  => {1, 2};
//                          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet test10() => const <int>{1, 2};
//                          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LinkedHashSet<C> test11() => <C>{};
//                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<C> test12() => const <C>{};
//                             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<C> test13() => <C>{new C()};
//                             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<int> test14() => {new C()};
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LinkedHashSet test15() => <C>{};
//                          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet test16() => const <C>{};
//                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet test17() => <C>{new C()};
//                          ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet test18() => {new C()};
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
