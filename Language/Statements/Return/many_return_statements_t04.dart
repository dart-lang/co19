// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement with no expression, `return;`
/// returns without an object.
///
/// @description Checks that it is not an error if a function literal with
/// context type `_` has explicit and implicit return statements of different
/// kind.
/// @author ilya
/// @issue 14764, 39476, 42581

main() {
  (x) {
    if (x) {
      return 1;
    }
    // implicit return;
  } (true);
}
