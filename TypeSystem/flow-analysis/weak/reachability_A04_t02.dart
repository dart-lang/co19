// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion null literal: If N is the literal null, then:
///  Let null(N) = before(N).
///  Let notNull(N) = unreachable(before(N))
///
/// @description Checks reachability after null literal
/// @author sgrekhov@unipro.ru
/// @issue 41985

// Requirements=nnbd-weak

main() {
  int i;
  if (null == null) {
    i = 42;  // condition is always true therefore `i` must be definitely assigned
  }
  i;  // It's not an error to read local non-nullable variable if it is definitely assigned
}
