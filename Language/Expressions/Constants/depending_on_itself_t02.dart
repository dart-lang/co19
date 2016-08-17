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
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

const a1 = a10;
const a2 = a1;
const a3 = a2;
const a4 = a3;
const a5 = a4;
const a6 = a5;
const a7 = a6;
const a8 = a7;
const a9 = a8;
const a10 = a9;

main() {
  print(a10);}
