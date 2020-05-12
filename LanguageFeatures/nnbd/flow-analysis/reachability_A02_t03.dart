/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion True literal: If N is the literal true, then:
 *  Let true(N) = before(N).
 *  Let false(N) = unreachable(before(N)).
 *
 * @description Checks reachability after true literal
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

main() {
  int i;
  if (true) {
  } else {
    i = 42;  // i is initialized in a dead code
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}
