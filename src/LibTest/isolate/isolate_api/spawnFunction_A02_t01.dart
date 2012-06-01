/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [topLevelFunction] argument must be a static top-level function
 * or a static method that takes no arguments. It is illegal to pass a function closure.
 * @description Checks that method throws an exception when given a static method or
 * a top-level function with more than one positional parameter, or when given
 * a closure or a method.
 * @static-warning
 * @author iefremov
 * @needsreview documentation looks incomplete
 */

#import("dart:isolate");

f(z) {}
var x = null;

class A{
  m() {}
  static s(z) {}
}

main() {
  x = (){};
  Expect.throws(() => spawnFunction((){}));
  Expect.throws(() => spawnFunction(f));
  Expect.throws(() => spawnFunction(x));
  Expect.throws(() => spawnFunction(new A().m));
  Expect.throws(() => spawnFunction(A.s));
}
