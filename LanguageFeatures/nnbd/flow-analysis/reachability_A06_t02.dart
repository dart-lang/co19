/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Null check operator: If N is an expression of the form E!, then:
 *  Let before(E) = before(N)
 *  Let null(N) = unreachable(null(E))
 *  Let nonNull(N) = nonNull(E)
 * @description Checks reachability after Null check operator
 *
 * @author sgrekhov@unipro.ru
 * @issue 42021
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

main () {
  int i;
  String? s = "";
  if (s! != null) {
    i = 42;  // condition is always true therefore `i` must be definitely assigned
  }
  i;  // It's not an error to read local non-nullable variable if it is definitely assigned
}
