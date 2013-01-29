/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an exception or error if the argument 
 * is null or is not a function and doesn't have a call() method with an appropriate 
 * signature (as long as the list isn't empty).
 * @description Checks that something is thrown if the argument
 * is not a closure, doesn't implement a call() method with appropriate signature or is null.
 * @static-warning
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */

class A {
  A() {}
}

main() {
  List<String> list = ["1","2","3"];
  Expect.throws(() => list.every(false)); /// static type warning not assignable
  Expect.throws(() => list.every(1)); /// static type warning not assignable
  Expect.throws(() => list.every("every")); /// static type warning not assignable
  Expect.throws(() => list.every([1, 2, 3])); /// static type warning not assignable
  Expect.throws(() => list.every(new A())); /// static type warning not assignable
  Expect.throws(() => list.every(null));
}
