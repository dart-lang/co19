// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion If s is a set literal, then it has the form
 * const? ('<' type '>')? '{' ... '}' where ... is zero or more comma-separated
 * element expressions (potentially with a trailing comma which is otherwise
 * ignored).
 * @description Checks set literal syntax
 * @author sgrekhov@unipro.ru
 */
main() {
  var v1  = const <int?> {,};
// [error line 15, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var v2  = const {,};
// [error line 19, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var v3  = {,};
  //         ^
  // [analyzer] SYNTACTIC_ERROR.MISSING_IDENTIFIER
  // [cfe] Expected an identifier, but got ','.
  var v4  = const <int?> {,,};
// [error line 27, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var v5  = const {,,};
// [error line 31, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var v6  = {,,};
// [error line 35, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
