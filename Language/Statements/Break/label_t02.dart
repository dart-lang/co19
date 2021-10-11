// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let sb be a break statement. If sb is of the form break L;, then
/// let sE be the innermost labeled statement with label L enclosing sb. If
/// sb is of the form break;, then let sE be the innermost do, for, switch or
/// while statement enclosing sb. It is a compile-time error if no such statement
/// sE exists within the innermost function in which sb occurs.
/// @description Checks that it is a compile-time error when a break statement of
/// the form "break L;" occurs outside of a labeled statement.
/// @author rodionov


foo() {
  for (int i in [1, 2]) {
    break L;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  L: do {
    foo();
  } while (false);
}
