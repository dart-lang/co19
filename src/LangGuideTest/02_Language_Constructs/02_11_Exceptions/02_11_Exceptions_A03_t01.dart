// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion Catching exceptions of type Object or writing no type in the catch clause
 * will catch all exceptions.
 * @description Checks catching various objects.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  A() {}
}


void check(var a) {
  try {
    throw a;
  } catch(var e) {
    Expect.isTrue(e === a);
  }

  try {
    throw a;
  } catch(Object e) {
    Expect.isTrue(e === a);
  }
}

main() {
  check(new A());
  check(1);
  check("");
  check([]);
  check(void _(){});
}
