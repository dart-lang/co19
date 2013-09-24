/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion   Evaluation of e proceeds as follows:
 * First, the argument list (a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k )
 * is evaluated.
 * Then, if q is a non-factory constructor of an abstract class then an
 * AbstractClassInstantiationError is thrown.
 * If T is malformed a dynamic error occurs.
 * In checked mode, if T is malbounded a dynamic error occurs.
 * Otherwise, if q is not defined or not accessible, a NoSuchMethodError is thrown.
 * If q has less than n positional parameters or more than n required parameters,
 * or if q lacks any of the keyword parameters {xn+1 , . . . , xn+k },
 * a NoSuchMethodError is thrown.
 * @description  Checks that the argument list is evaluated before the 
 * AbstractClassInstantiationError is thrown.
 * @static-warning
 * @author kaigorodov
 * @issue 13420
 */
import "../../../Utils/expect.dart";

abstract class C {
  C(int k) {}
}

bool seen=false;
int f() {
  seen=true;
  return 1;
}

main() {
  try {
    new C(f());
    Expect.fail("Should throw AbstractClassInstantiationError");
  } on AbstractClassInstantiationError catch(e) {}
  Expect.isTrue(seen);
}
