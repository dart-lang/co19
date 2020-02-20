/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for a variable to be declared as late in any of the
 * following positions: in a formal parameter list of any kind; in a catch
 * clause; in the variable binding section of a c-style for loop, a for in loop,
 * an await for loop, or a for element in a collection literal.
 *
 * @description Check that it is an error if variable declared late in a catch
 * clause
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
void test() {}

main() {
  try {
    test();
  } on Exception catch (late e) {
//                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
