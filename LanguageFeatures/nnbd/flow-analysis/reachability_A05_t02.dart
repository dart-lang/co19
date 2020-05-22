/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion other literal: If N is some other literal than the above, then:
 *  Let null(N) = unreachable(before(N)).
 *  Let notNull(N) = before(N)
 * @description Checks reachability after string literal
 *
 * @author sgrekhov@unipro.ru
 * @issue 41985
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

main() {
  int i;
  if ("Lily was here" != null) {
    i = 42;  // condition is always true therefore `i` must be definitely assigned
  }
  i;  // It's not an error to read local non-nullable variable if it is definitely assigned
}
