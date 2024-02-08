// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion False literal: If N is the literal false, then:
///  Let true(N) = unreachable(before(N)).
///  Let false(N) = before(N)
///
/// @description Checks reachability after false literal
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

main() {
  int i;
  if (false) {
  } else {
    i = 42;   // Variable is definitely assigned here
  }
  i;  // It's not an error to read local non-nullable variable which is definitely assigned
}
