/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of e proceeds as follows:
 * If q is a constructor of an abstract class then an AbstractClassInstantiationError is thrown.
 * If T is not a class accessible in the current scope, a dynamic error occurs.
 * Otherwise, if q is not defined or not accessible, a NoSuchMethodError is thrown.
 * @description  Checks that AbstractClassInstantiationError is thrown if T is
 * an abstract class.
 * @author kaigorodov
 */

abstract class C {
  C.namedConstructor() {}
}

main() {
  try {
    new C.namedConstructor();
    Expect.fail("Should throw AbstractClassInstantiationError");
  } on AbstractClassInstantiationError catch(e) {}
}
