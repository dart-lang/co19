/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form C.v = e proceeds as follows:
 * The expression e is evaluated to an object o. If there is no class C in the
 * enclosing lexical scope of the assignment, or if C does not declare, implicitly or
 * explicitly, a setter v =, then a NoSuchMethodError is thrown. Otherwise, the
 * setter C.v = is invoked with its formal parameter bound to o. The value of the
 * assignment expression is o.
 *   It is a static warning if there is no class C in the enclosing lexical scope of
 * the assignment, or if C does not declare, implicitly or explicitly, a setter v =.
 *   In checked mode, it is a dynamic type error if o is not null and the interface
 * of the class of o is not a subtype of the static type of C.v.
 *   It is a static type warning if the static type of e may not be assigned to the
 * static type of C.v. The static type of the expression C.v = e is the static type
 * of e.
 * @description Checks that it is a static type warning if there is no class C in the
 * enclosing lexical scope of assignment and that such code results in a NoSuchMethodError.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

main() {
  try {
    C.v = 2; /// static type warning
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
}
