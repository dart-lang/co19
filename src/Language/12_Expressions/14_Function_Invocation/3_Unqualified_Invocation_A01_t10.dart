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
 * Otherwise, i is equivalent to the ordinary method invocation this.id(a1, ... , an, xn+1 :
 * an+1, ... , xn+k : an+k).
 * @description Checks that 'this' appears implicitly in a top-level function
 * and causes a compile-error.
 * Additional assertion is taken into account from "12.10 This":
 * It is a compile-time error if 'this' appears in a top-level function or variable initializer,
 * in a factory constructor, or in a static method or variable initializer,
 * or in the initializer of an instance variable.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 * @issue 7025
 */

main() {
  try {
    undeclared();
  } catch (anything) {}
}
