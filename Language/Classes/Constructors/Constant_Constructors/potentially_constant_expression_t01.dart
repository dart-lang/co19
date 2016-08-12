/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any expression that appears within the initializer list of a
 * constant constructor must be a potentially constant expression, or a
 * compile-time error occurs.
 *
 * A potentially constant expression is an expression E that would be a valid
 * constant expression if all formal parameters of E's immediately enclosing
 * constant constructor were treated as compile-time constants that were
 * guaranteed to evaluate to an integer, boolean or string value as required
 * by their immediately enclosing superexpression.
 * @description Checks that it is a compile-time error when a constant
 * constructor's initializer list contains non-constant list literal.
 * @compile-error
 * @author iefremov
 */

class A {
  final x;
  const A(var p) : x = [p];
}

main() {
  try {
    var a = const A(1);
  } catch (x) {}
}
