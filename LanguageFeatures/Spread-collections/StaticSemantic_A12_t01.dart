/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion n/a
 * @description: Checks that list with spread element cannot reference itself
 * @author iarkh@unipro.ru
 */

main() {
  List l1  = [...l1];
// [error line 13, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l2  = [...[l2]];
// [error line 17, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l3  = [...{l3}];
// [error line 21, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l4  = [...[...l4]];
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l5  = [...{...l5}];
// [error line 29, column 0]
// [analyzer] unspecified
// [cfe] unspecified

  List l6  = [...?l6];
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l7  = [...?[l7]];
// [error line 38, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l8  = [...?{l8}];
// [error line 42, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l9  = [...?[...?l9]];
// [error line 46, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List l10 = [...?{...?l10}];
// [error line 50, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
