// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion n/a
 * @description: Checks that map with spread element cannot reference itself
 * @author iarkh@unipro.ru
 */

main() {
  Map m1 = {...m1};
// [error line 13, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map m2 = {...{...m2}};
// [error line 17, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map m3 = {...{m3}};
// [error line 21, column 0]
// [analyzer] unspecified
// [cfe] unspecified

  Map m4 = {...?m4};
// [error line 26, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map m5 = {...{...?m5}};
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map m6 = {...{?m6}};
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
