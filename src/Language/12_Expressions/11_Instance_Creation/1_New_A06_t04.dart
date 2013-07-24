/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of e proceeds as follows:
 * If q is a non-factory constructor of an abstract class then an
 * AbstractClassInstantiationError is thrown.
 * If T is not a class accessible in the current scope, a dynamic error occurs.
 * If q has less than n positional parameters or more than n required parameters, or
 * if q lacks any of the keyword parameters {xn+1 , . . . , xn+k } a NoSuchMethodError
 * is thrown.
 * Otherwise, if q is not defined or not accessible, a NoSuchMethodError is thrown.
 * @description  Checks that a NoSuchMethodError is thrown if q is not defined.
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class C {
  C.namedConstructor() {}
}

main() {
  try {
    new C(); /// static warning - invoking an undeclared constructor of an existing class, see "Instance creation|New"
    Expect.fail("Should throw NoSuchMethodError");
  } on NoSuchMethodError catch(e) {}
}
