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
 * @description Checks that CyclicInitializationError is thrown when getter
 * is referenced during evaluation of initialization expression.
 * @author kaigorodov
 */

int f() {
  return C.sTyped;
}

class C {
  static int sTyped = f();
}


main() {
  try {
    C.sTyped;
    Expect.fail('CyclicInitializationError is expected');
  } on CyclicInitializationError catch (e) {
  } catch (e) {
    Expect.fail('"$e" of type ${e.runtimeType} thrown instead of CyclicInitializationError');
  }
}
