/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to use a spread element in a constant
 * list or set unless the spread object was created by a constant list or set
 * literal expression.
 * @description Checks that compile error is thrown if spread element is not a
 * constant list or set literal in the constant list
 * @author iarkh@unipro.ru
 */

List list1 = [2, 7, 9];
Set list2 = {"checkme"};
List list3 = [];
List? list4 = null;

main() {
  const res1 = [...list1];
// [error line 21, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res2 = [...?list1];
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res3 = [...list2];
// [error line 29, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res4 = [...?list2];
// [error line 33, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res5 = [...list3];
// [error line 37, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res6 = [...?list3];
// [error line 41, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res7 = [...?list4];
// [error line 45, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res8 = [1, 2, ...list1, 6];
// [error line 49, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res9 = [1, ...list1, ...list2, ...list3, ...?list4, 18];
// [error line 53, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
