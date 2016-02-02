/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an multiplicative expression is usually
 * determined by the signature given in the declaration of the operator used.
 * However, invocations of the operators *, % and ~/ of class int are treated
 * specially by the typechecker.
 *   The static type of an expression e1 * e2 where e1 has static type int is
 * int if the static type of e2 is int, and double if the static type of e2 is
 * double.
 *   The static type of an expression e1 % e2 where e1 has static type int is
 * int if the static type of e2 is int, and double if the static type of e2 is
 * double.
 * The static type of an expression e1 ~/ e2 where e1 has static type int is
 * int if the static type of e2 is int.
 * @description Checks special cases for static types of expressions
 * x * y, x % y, x ~/ y when x is int.
 * @static-clean
 * @author ilya
 */

int    f1(int x, int y)    => x * y;
double f2(int x, double y) => x * y;
int    f3(int x, int y)    => x % y;
double f4(int x, double y) => x % y;
int    f5(int x, int y)    => x ~/ y;

main () {
  f1(4, 3);
  f2(4, 3.0);
  f3(4, 3);
  f4(4, 3.0);
  f5(4, 3);
}