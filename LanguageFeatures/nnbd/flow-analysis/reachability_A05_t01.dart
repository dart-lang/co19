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
  late int i;
  if ("Lily was here" == null) {
    i = 42;  // Variable is initialized in a dead code. This leaves it definitely unassigned
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
