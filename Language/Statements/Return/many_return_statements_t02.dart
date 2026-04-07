// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement with no expression, `return;`
/// returns without an object.
///
/// @description Checks that if the context type of a function literal is `_`
/// then it is a compile-time error if a function literal has both `return;` and
/// `return e;` statements.
/// @author ilya
/// @issue 39476, 42459

main() {
  (x) {
    if (x) {
      return 1;
    } else {
      return;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  } (true);
}
