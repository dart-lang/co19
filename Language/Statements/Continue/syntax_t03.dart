// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The continue statement consists of the reserved word continue and
/// an optional label.
/// continueStatement:
///   continue identifier? ';'
///
/// @description Checks that it is a syntax error if a `continue L` statement
/// occurs in a switch expression.
/// @author sgrekhov22@gmail.com

main() {
  int x = 2;
  var y = switch (x) {
    L: 1 => '1',
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    2 => continue L,
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => 'default'
  };
}
