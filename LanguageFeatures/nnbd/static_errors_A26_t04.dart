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
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
test1() {
  late int x;
  x++;
// ^^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  late int x;
  ++x;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  late int x;
  x--;
// ^^
// [analyzer] unspecified
// [cfe] unspecified
}

test4() {
  late int x;
  --x;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test1();
  test2();
  test3();
  test4();
}
