/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the value of a compile-time constant expression
 * depends on itself
 * @description Checks that it is a compile-time error if there is a circular reference in
 * a final variable's initialization.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

final a1 = a10;
final a2 = a1;
final a3 = a2;
final a4 = a3;
final a5 = a4;
final a6 = a5;
final a7 = a6;
final a8 = a7;
final a9 = a8;
final a10 = a9;

main() {
  try {
    print(a10);
  } catch(var x) {}
}
