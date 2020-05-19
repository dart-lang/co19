/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an additive expression is usually determined
 * by the signature given in the declaration of the operator used. However,
 * invocations of the operators + and - of class int are treated specially
 * by the typechecker.
 *   The static type of an expression e1 + e2 where e1 has static type int is
 * int if the static type of e2 is int, and double if the static type of e2 is
 * double.
 *   The static type of an expression e1 - e2 where e1 has static type int is
 * int if the static type of e2 is int, and double if the static type of e2 is
 * double.
 * @description Checks special cases for static types of x+y, x-y when x is int.
 * @static-clean
 * @author ilya
 */

int f1(int x, int y) => x + y;
int f2(int x, int y) => x - y;
double f3(int x, double y) => x + y;
double f4(int x, double y) => x - y;

main() {
  f1(1, 2);
  f2(1, 2);
  f3(1, 2.0);
  f4(1, 2.0);
}
