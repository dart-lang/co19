/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Calling a redirecting factory constructor k causes the
 * constructor k' denoted by type (respectively, type.identifier) to be called
 * with the actual arguments passed to k, and returns the result of k' as the
 * result of k. The resulting constructor call is governed by the same rules
 * as an instance creation expression using new.
 * @description Checks that compile error occurs when referenced type is not
 * defined or refers to non class or non constructor.
 * @compile-error
 * @author ilya
 */

function() {}
var variable;

class F {
  factory F() = C;            //# 01: compile-time error
  factory F.foo() = function; //# 02: compile-time error
  factory F.bar() = variable; //# 03: compile-time error
  factory F.baz() = D.baz;    //# 04: compile-time error
}

class D {
  void baz() {}
}

main() {
}
