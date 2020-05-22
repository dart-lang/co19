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
  late int i;
  String? s = "";
  if (s! == null) {
    i = 42;  // Variable is initialized in a dead code. This leaves it definitely unassigned
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
