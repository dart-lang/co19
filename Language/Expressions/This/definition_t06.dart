/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The reserved word this denotes the target of the current instance
 * member invocation.
 *   thisExpression:
 *     this
 *   ;
 * @description Checks that 'this' denotes instance target.
 * @author hlodvig
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class A{
  int x = 5;

  A getSelf() {
    return this;
  }
}

main() {
  A a = new A();
  Expect.isTrue(a.getSelf() is A);
  Expect.equals(a, a.getSelf());
  Expect.equals(5, a.x);
  Expect.equals(5, a.getSelf().x);

  a.x = 1;
  Expect.equals(1, a.x);
  Expect.equals(1, a.getSelf().x);

  a.getSelf().x = 2;
  Expect.equals(2, a.x);
  Expect.equals(2, a.getSelf().x);
}
