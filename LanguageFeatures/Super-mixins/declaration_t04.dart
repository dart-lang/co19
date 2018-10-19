/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration defines an interface. The interface for this
 * mixin declaration is equivalent to the interface of the class declared as:
 *  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
 *    implements D, E { body' }
 * where body' contains abstract declarations corresponding to the instance
 * members of body of the mixin A.
 * It is a compile time error for the mixin declaration if this class
 * declarations would not be valid.
 *
 * @description Checks that mixin declaration may have no implementation of all
 * declared methods and properties
 * @author sgrekhov@unipro.ru
 */

abstract class I {
  int get i1;
  void i2();
  void set i3(int);
}
abstract class J {
  int get j1;
  void j2();
  void set j3(int);
}

abstract class B {
  int get b1;
  void b2();
  void set b3(int);
}
abstract class C {
  int get c1;
  void c2();
  void set c3(int);
}

mixin M on B, C implements I, J {}

main() {
}
