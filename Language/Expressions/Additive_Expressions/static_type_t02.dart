/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks different cases for static types of x + y, x - y when
 * arguments are int or double.
 * @static-clean
 * @author ngl@unipro.ru
 */

main() {
  int i1 = 1 + 1;
  double d2 = 1 + 1.2;
  double d3 = 1.2 + 1;
  double d4 = 1.2 + 1.2;
}
