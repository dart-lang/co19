// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `sc` be a `continue` statement. If `sc` is of the form
/// `continue L;`, then it is a compile-time error if `sc` is not enclosed in
/// either an `await for`, `do`, `for`, or `while` statement labeled with `L`,
/// or in a `switch` statement with a case clause labeled with `L`, within the
/// innermost function in which `sc` occurs.
///
/// @description Checks that it is not an error when a `continue L;` statement
/// occurs in a `case` clause and `L` is a label of the `default` clause in the
/// enclosing switch statement.

import '../../../Utils/expect.dart';

main() {
  var log = '';
  int x = 1;
  switch (x) {
    case 1:
      continue L;
    case 2:
      log = '2';
    L:
    default:
      log = 'default';
  }
  Expect.equals('default', log);
}
