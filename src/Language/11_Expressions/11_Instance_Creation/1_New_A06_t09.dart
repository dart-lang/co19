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
 * If q has less than n positional parameters or more than n required parameters, or
 * if q lacks any of the keyword parameters {xn+1 , . . . , xn+k } a NoSuchMethodError
 * is thrown.
 * @description  Checks that a NoSuchMethodError is thrown if constructor lacks a keyword
 * parameter.
 * @author kaigorodov
 */
 
class C {
   C({var y:1}) {}
}

test() {
  return new C(x:1); 
}

main() {
  Expect.throws(test, (e) => e is NoSuchMethodError);
}
