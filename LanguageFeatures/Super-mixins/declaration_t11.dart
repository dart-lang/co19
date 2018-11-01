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
 *   implements D, E { body' }.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

abstract class B {
  String get b;
}

class C {
  String get c => "C";
}

class D {
  String get d => "D";
}

abstract class E {
  String get e;
}

mixin A<X extends S, Y extends T> on B, C implements D, E {
  S x = new S();
  T y = new T();
}

class AI implements A<X, Y> {
  S x = new X();
  T y = new Y();

  String get b => "AI";
  String get c => "AI";
  String get d => "AI";
  String get e => "AI";

  test() {
    Expect.equals("AI", this.b);
    Expect.equals("AI", this.c);
    Expect.equals("AI", this.d);
    Expect.equals("AI", this.e);
  }
}

main() {
  AI ai = new AI();
  Expect.equals("AI", ai.b);
  Expect.equals("AI", ai.c);
  Expect.equals("AI", ai.d);
  Expect.equals("AI", ai.e);
  ai.test();
}
