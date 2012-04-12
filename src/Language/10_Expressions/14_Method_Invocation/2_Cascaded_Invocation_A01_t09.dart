/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation has the form e..suffix where suffix is a sequence
 * of operator, method, getter or setter invocations.
 * cascadeSection:
 *   '..'  (assignableSelector arguments*)+ (assignmentOperator expression)?
 * ;
 * @description Checks that it is a compile-time error if suffix is a map literal.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

class C {
  m1() {}
}

main() {
  var o = new C();
  try {
    o..{'k1': 1, 'k2': 2};
  } catch(var e) {}
}

