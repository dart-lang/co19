/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion False literal: If N is the literal false, then:
 *  Let true(N) = unreachable(before(N)).
 *  Let false(N) = before(N)
 *
 * @description Checks reachability after false literal
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

main() {
  int i;
  false ? "nothing" : i = 42;
  i;
}
