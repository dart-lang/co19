// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion When an exception is raised, the execution stack is searched for the first
 * matching catch clause. An exception matches a clause if (and only if) the exception is an
 * instance of the type specified in the clause or if no type has been specified. When the
 * matching catch clause has been found, the execution stack is unwound up to the activation
 * frame containing the matched catch clause and the execution continues at the start of the
 * catch clause.
 * @description Checks that catch clause with type A catches exception of type C if C is a subclass of A.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  A(this.x) {}
  int x;
}

class C extends A {
  C(x) : super(x) {}
}


main() {
  bool capture = false;
  try {
    throw new C(1);
  } catch (A e) {
    capture = true;
    Expect.isTrue(e.x == 1);
  }
  Expect.isTrue(capture);
}
