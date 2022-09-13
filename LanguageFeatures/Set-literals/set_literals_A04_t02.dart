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
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
//                                   ^
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<int>'.
  LinkedHashSet<int> test2() => const <int>{};
//                              ^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<int>'.
  LinkedHashSet<int> test3() => <int>{1, 2};
//                              ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
//                                   ^
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<int>'.
  LinkedHashSet<int> test4() => {1, 2};
//                              ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<int>'.
  LinkedHashSet<int> test5() => const <int>{1, 2};
//                              ^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<int>'.

  LinkedHashSet test6()  => <int>{};
//                          ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
//                               ^
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
  LinkedHashSet test7()  => const <int>{};
//                          ^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
  LinkedHashSet test8()  => <int>{1, 2};
//                          ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
//                               ^
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
  LinkedHashSet test9()  => {1, 2};
//                          ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
  LinkedHashSet test10() => const <int>{1, 2};
//                          ^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<int>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.

  LinkedHashSet<C> test11() => <C>{};
//                             ^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
//                                ^
// [cfe] A value of type 'Set<C>' can't be returned from a function with return type 'LinkedHashSet<C>'.
  LinkedHashSet<C> test12() => const <C>{};
//                             ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<C>' can't be returned from a function with return type 'LinkedHashSet<C>'.
  LinkedHashSet<C> test13() => <C>{new C()};
//                             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LinkedHashSet<int> test14() => {new C()};
//                               ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<C>' can't be returned from a function with return type 'LinkedHashSet<int>'.

  LinkedHashSet test15() => <C>{};
//                          ^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
//                             ^
// [cfe] A value of type 'Set<C>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
  LinkedHashSet test16() => const <C>{};
//                          ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [cfe] A value of type 'Set<C>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
  LinkedHashSet test17() => <C>{new C()};
//                          ^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
//                             ^
// [cfe] A value of type 'Set<C>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
  LinkedHashSet test18() => {new C()};
//                          ^^^^^^^^^
// [ analyzer] COMPILE_TIME_ERROR.RETURN_OF_INVALID_TYPE
// [ cfe] A value of type 'Set<C>' can't be returned from a function with return type 'LinkedHashSet<dynamic>'.
}
