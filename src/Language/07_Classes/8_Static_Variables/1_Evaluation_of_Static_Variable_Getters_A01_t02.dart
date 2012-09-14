/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let d be the declaration of a static variable v. The implicit getter method of v executes as follows:
 *   If d is of one of the forms static var v = e; , static T v = e; , static ﬁnal
 * v = e; or static ﬁnal T v = e; and no value has yet been stored into
 * v then the initializer expression e is evaluated. If, during the evaluation
 * of e, the getter for v is referenced, a CyclicInitializationError is thrown. If
 * the evaluation succeeded yielding an object o, let r = o, otherwise let
 * r = null. In any case, r is stored into v. The result of executing the
 * getter is r.
 *   If d is of one of the forms static const v = e; or static const T v = e;
 * the result of the getter is the value of the compile time constant e. Otherwise
 *   The result of executing the getter method is the value stored in v.
 * @description Checks that if evaluation of the initializer expression of
 * a static variable is not succeeded, the variable is initialized with [:null:].
 * @author msyabro
 * @reviewer iefremov
 */

f() {
  throw 1;
}

class C {
  static var sVar = f();
  static int sTyped = f();
  static final sFinal = f();
  static final int sFinalTyped = f();
}


main() {
  try {
    C.sVar;
    Expect.fail('An exception is expected');
  } on int catch (e) {
    Expect.equals(1, e);
    Expect.equals(null, C.sVar);
  }

  try {
    C.sTyped;
    Expect.fail('An exception is expected');
  } on int catch (e) {
    Expect.equals(1, e);
    Expect.equals(null, C.sTyped);
  }

  try {
    C.sFinal;
    Expect.fail('An exception is expected');
  } on int catch (e) {
    Expect.equals(1, e);
    Expect.equals(null, C.sFinal);
  }

  try {
    C.sFinalTyped;
    Expect.fail('An exception is expected');
  } on int catch (e) {
    Expect.equals(1, e);
    Expect.equals(null, C.sFinalTyped);
  }
}
