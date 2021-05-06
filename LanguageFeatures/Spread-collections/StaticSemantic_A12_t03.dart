// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion n/a
 * @description: Checks that set with spread element cannot reference itself
 * @author iarkh@unipro.ru
 */

main() {
  Set s1  = {...s1};
// [error line 13, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s2  = {...[s2]};
// [error line 17, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s3  = {...{s3}};
// [error line 21, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s4  = {...{...s4}};
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s5  = {...[...s5]};
// [error line 29, column 0]
// [analyzer] unspecified
// [cfe] unspecified

  Set s6  = {...?s6};
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s7  = {...?[s7]};
// [error line 38, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s8  = {...?{s8}};
// [error line 42, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s9  = {...?{...?s9}};
// [error line 46, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s10 = {...?[...?s10]};
// [error line 50, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
