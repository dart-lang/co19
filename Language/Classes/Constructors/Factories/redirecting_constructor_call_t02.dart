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
 * @description Checks that dynamic error occurs when referenced type is not
 * defined or refers to non class or non constructor.
 * @static-warning
 * @author ilya
 */
import "../../../../Utils/expect.dart";

function() {}
var variable;

class F {
  factory F() = C;            // refers to undefined id
  factory F.foo() = function; // refers to library function
  factory F.bar() = variable; // refers to library variable
  factory F.baz() = D.baz;    // refers to non constructor
}

class D {
  void baz() {}
}

main() {
  Expect.throws(() => new F());
  Expect.throws(() => new F.foo());
  Expect.throws(() => new F.bar());
  Expect.throws(() => new F.baz());
}
