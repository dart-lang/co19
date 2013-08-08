/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form id(a1, ... , an, xn+1 : an+1, ... , xn+k :
 * an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the inner-
 * most such declaration. Then:
 *  - If fid is a local function, a library function, a library or static getter or a
 * variable then i is interpreted as a function expression invocation.
 *  - Otherwise, if fid is a static method of the enclosing class C, i is equivalent to
 * the static method invocation C.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 *  - Otherwise, if i occurs inside a top level or static function (be it function,
 * method, getter, or setter) or variable initializer, evaluation of i causes a
 * NoSuchMethodError to be thrown.
 * Otherwise, i is equivalent to this.id(a1, ..., an, xn+1:an+1, ..., xn+k:an+k).
 * @description Checks that undeclared identifier inside a top level function
 * causes a static warning and NoSuchMethodError.
 * Additional assertion is taken into account from "12.31 Identifier Reference":
 * It is as static warning if an identifier expression id occurs inside a top level or
 * static function (be it function, method, getter, or setter) or variable initializer
 * and there is no declaration d with name id in the lexical scope enclosing the expression.
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  try {
    undeclared();
  } on NoSuchMethodError catch (ok) {}
}
