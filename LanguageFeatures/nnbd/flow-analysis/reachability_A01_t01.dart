/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Variable or getter: If N is an expression of the form x where the
 * type of x is T then:
 *
 * If T <: Never then:
 *  Let null(N) = unreachable(before(N)).
 *  Let notNull(N) = unreachable(before(N)).
 * Otherwise if T <: Null then:
 *  Let null(N) = before(N).
 *  Let notNull(N) = unreachable(before(N)).
 * Otherwise if T is non-nullable then:
 *  Let null(N) = before(N).
 *  Let notNull(N) = unreachable(before(N)).
 *
 * @description Checks reachability after variable or getter. Test variable of
 * type Never
 *
 * @author sgrekhov@unipro.ru
 * @issue 41815
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

void test(Never n) {
  int i;
  do {
    n;        // the code after this point is unreachable
    i = 42;   // variable is initialized in a dead code
  } while (false);
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  try {
    test(throw "Lily was here");
  } catch (_) {
  }
}
