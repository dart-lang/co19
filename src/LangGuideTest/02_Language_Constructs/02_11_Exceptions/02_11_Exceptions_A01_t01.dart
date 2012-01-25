// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion Exceptions are raised explicitly using the throw statement.
 * Thrown exceptions can be caught using catch clauses following a try statement.
 * Any object can be used for raising an exception with throw.
 * @description Checks that any object can be thrown and caught.
 * @author iefremov
 */

class A {
  const A(this.x);
  final x;
}


void check(var a) {
  try {
    throw a;
  } catch (var e) {
    Expect.isTrue(a === e);
  }
}

main() {
  check(new A(-1));
  check("test");
  check(1);
  check([]);
  check(void _() {});
}
