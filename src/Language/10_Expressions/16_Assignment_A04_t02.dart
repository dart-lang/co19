/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form C.v = e proceeds as follows:
 * The expression e is evaluated to an object o. If there is no class C in the
 * enclosing lexical scope of the assignment, or if C does not declare, implicitly
 * or explicitly, a setter v, then a NoSuchMethodError is thrown. 
 * Otherwise, the setter C.v is invoked  with its formal parameter bound to o.
 * The value of the assignment expression is o.
 * It is a static warning if there is no class C in the enclosing lexical scope
 * of assignment, or if C does not declare, implicitly or explicitly, a setter v. In
 * checked mode, it is a dynamic type error if o is not null and the interface
 * of the class of o is not a subtype of the static type of C.v.
 * It is a static type warning if the static type of e may not be assigned to the
 * static type of C.v.
 * @description Checks the value of an assignment of the form C.v = e is e evaluated to o.
 * @author msyabro
 * @reviewer kaigorodov
 */

class C {
  static var v;
}

main() {
  Expect.equals(1, C.v = 1);
  Expect.equals(2, C.v = 2);
  Expect.equals(1, C.v = 1);
  Expect.equals(12, C.v = 2 * 6);
}
