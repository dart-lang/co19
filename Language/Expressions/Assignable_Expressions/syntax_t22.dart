/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Assignable expressions are expressions that can appear on the
 * left hand side of an assignment.
 * assignableExpression:
 *   primary (arguments* assignableSelector)+ |
 *   super unconditionalAssignableSelector |
 *   identifier
 * ;
 * unconditionalAssignableSelector:
 *   '[' expression ']' |
 *   '.' identifier
 * ;
 * assignableSelector:
 *   unconditionalAssignableSelector |
 *   '?.' identifier
 * ;
 * An assignable expression is either:
 * • An identifier.
 * • An invocation (possibly conditional) of a getter or list access operator
 *   on an expression e.
 * • An invocation of a getter or list access operator on super.
 * @description Checks that a literal without assignableSelector
 * can't be used in the left hand side of an assignment.
 * @compile-error
 * @author msyabro
 */

main() {
  try {
    1 = 2;
  } catch (e) {}
}
