/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile time error to read a local variable marked late
 * when the variable is definitely unassigned. This includes all forms of reads,
 * including implicit reads via the composite assignment operators as well as
 * pre and post-fix operators.
 *
 * @description Check that is a compile time error to read a local variable
 * marked late when the variable is definitely unassigned. This includes all
 * forms of reads, including implicit reads via the composite assignment
 * operators as well as pre and post-fix operators
 * @author sgrekhov@unipro.ru
 * @issue 39876
 * @issue 40943
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

main() {
  late num x;
  x ??=
//^
// [analyzer] unspecified
// [cfe] unspecified
        1;
//      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
}
