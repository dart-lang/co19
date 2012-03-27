/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let d be the declaration of a static variable v. The implicit getter method of v executes as follows:
 *   If d is of one of the forms static var v = e; , static T v = e; , static final v = e;
 * or static final T v = e; and no value has yet been stored into v then the initializer
 * expression e is evaluated. If the evaluation succeeded yielding an object o, let r = o,
 * otherwise let r = null. In any case, r is stored into v. The result of executing the getter is r. Otherwise
 *   The result of executing the getter method is the value stored in v.
 * @description Checks that the initializer expression is evaluated at
 * the first use of a static variable.
 * @author msyabro
 * @reviewer iefremov
 */

var counter = 0;

class C {
  static var sVar = ++counter;
  static int sTyped = ++counter;
  static final sFinal = ++counter;
  static final int sFinalTyped = ++counter;
}


main() {
  Expect.equals(0, counter);
  Expect.equals(1, C.sVar);
  Expect.equals(1, counter);
  Expect.equals(2, C.sTyped);
  Expect.equals(2, counter);
  Expect.equals(3, C.sFinal);
  Expect.equals(3, counter);
  Expect.equals(4, C.sFinalTyped);
  Expect.equals(4, counter);
}
