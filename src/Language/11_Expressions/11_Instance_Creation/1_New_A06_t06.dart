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
 * @description  Checks that a NoSuchMethodError is thrown if q is not accessible.
 * @author kaigorodov
 */

import "1_New_A06_t06_lib.dart";

main() {
  try {
    new C._inaccessibleConstructor();
    Expect.fail("Should throw NoSuchMethodError");
  } on NoSuchMethodError catch(e) {}
}
