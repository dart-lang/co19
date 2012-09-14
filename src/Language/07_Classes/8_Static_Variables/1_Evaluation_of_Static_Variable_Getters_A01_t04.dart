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
 * @description Checks the result of the getter of a constant static variable.
 * @author msyabro
 * @reviewer iefremov
 */

class Const {
  const Const(this.x);
  final x;
}

class C {
  static const sConst = const Const(1);
  static const int sConstTyped = 2;
}


main() {
  Expect.equals(1, C.sConst.x);
  Expect.equals(2, C.sConstTyped);
}
