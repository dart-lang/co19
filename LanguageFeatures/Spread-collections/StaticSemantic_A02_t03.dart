// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This is true even if the object being spread is a user-defined
/// class that implements [Iterable] but isn't even a subtype of List.
///
/// @description Checks that compile error appears if list spread element does
/// not extends [Iterable].
/// @author iarkh@unipro.ru

main() {
  int i = 1;
  String str = "abs";
  List l1 = [...{1: 11}];
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l2 = [1, 2, ...i];
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  List l3 = [14, ...str, 28];
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int? i1 = i;
  String? str1 = str;
  List l4 = [...?({1: 11} as Map?)];
//               ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l5 = [1, 2, ...?i1]; // ignore: invalid_null_aware_operator
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l6 = [14, ...?str1, 28]; // ignore: invalid_null_aware_operator
//                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
