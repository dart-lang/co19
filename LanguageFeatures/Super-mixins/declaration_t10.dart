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
 * @description Checks that a mixin declaration in form
 * mixin A<X extends S, Y extends T> on B, C implements D, E { body }
 * is equivalent to the interface of the class declared as
 * abstract class A<X extends S, Y extends T> extends A$super<X, Y>
 *   implements D, E { body' }
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

abstract class B {
  String get b;         //# 01: compile-time error
}

class C {
  String get c => "C";  //# 02: compile-time error
}

class D {
  String get d => "D";  //# 03: compile-time error
}

abstract class E {
  String get e;         //# 04: compile-time error
}

mixin A on B, C implements D, E {
}

class AI implements A {
  // missing b
  String get c => "AI"; //# 01: compile-time error
  String get d => "AI"; //# 01: compile-time error
  String get e => "AI"; //# 01: compile-time error

  // missing c
  String get b => "AI"; //# 02: compile-time error
  String get d => "AI"; //# 02: compile-time error
  String get e => "AI"; //# 02: compile-time error

  // missing d
  String get b => "AI"; //# 03: compile-time error
  String get c => "AI"; //# 03: compile-time error
  String get e => "AI"; //# 03: compile-time error

  // missing e
  String get b => "AI"; //# 04: compile-time error
  String get c => "AI"; //# 04: compile-time error
  String get d => "AI"; //# 04: compile-time error
}

main() {
  AI ai = new AI();
}
