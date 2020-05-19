/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the value of a compile-time
 * constant expression depends on itself.
 * @description Checks that it is a compile-time error if there is a circular
 * reference in a constant variable's initialization.
 * @author iefremov
 */
// SharedOptions=--enable-experiment=non-nullable

const a1 = a10; //# 01: compile-time error
const a2 = a1;  //# 02: compile-time error
const a3 = a2;  //# 03: compile-time error
const a4 = a3;  //# 04: compile-time error
const a5 = a4;  //# 05: compile-time error
const a6 = a5;  //# 06: compile-time error
const a7 = a6;  //# 07: compile-time error
const a8 = a7;  //# 08: compile-time error
const a9 = a8;  //# 09: compile-time error
const a10 = a9; //# 10: compile-time error

main() {
  try {
    print(a10);
  } catch (x) {}
}
