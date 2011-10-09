/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance field can be initialized through a parameter initializer
 * in a non-factory constructor. A parameter initializer is prefixed by this. followed by
 * the name of the field. The field must be a local instance field.
 * The reference to it is statically bound: a subclass cannot intercept the assignment
 * with a user-defined setter.
 * @description Checks that instance field can be initialized through a parameter initializer.
 * @author pagolubev
 * @reviewer iefremov
 */


class A {
  A(int this.x_) {}

  int x_;
}


void main() {
  A a = new A(1);
  Expect.isTrue(a.x_ == 1);
}
