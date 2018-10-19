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

class S {
  String get id => "S";
}
class T {
  String get id => "T";
}
class X extends S {
  String get id => "X";
}
class Y extends T {
  String get id => "Y";
}

abstract class B<T> {
  String get b;
  T get tb;
}

abstract class C<T> {
  String get c => "C";
  T get tc;
}

abstract class D<T> {
  String get d => "D";
  T get td;
}

abstract class E<T> {
  String get e;
  T get te;
}

mixin A<X extends S, Y extends T> on B<X>, C<Y> implements D<S>, E<T> {
  String get d => "AD";
  S get td => new S();
  String get e => "AE";
  T get te => new T();
}

class AI implements A<X, Y> {

  String get b => "AI";
  String get c => "AI";
  String get d => "AI";
  String get e => "AI";

  X get tb => new X();
  Y get tc => new Y();
  S get td => new S();
  T get te => new T();

  test() {
    Expect.equals("AI", this.b);
    Expect.equals("AI", this.c);
    Expect.equals("AI", this.d);
    Expect.equals("AI", this.e);

    Expect.equals("X", this.tb.id);
    Expect.equals("Y", this.tc.id);
    Expect.equals("S", this.td.id);
    Expect.equals("T", this.te.id);
  }
}

main() {
  AI ai = new AI();
  Expect.equals("AI", ai.b);
  Expect.equals("AI", ai.c);
  Expect.equals("AI", ai.d);
  Expect.equals("AI", ai.e);

  Expect.equals("X", ai.tb.id);
  Expect.equals("Y", ai.tc.id);
  Expect.equals("S", ai.td.id);
  Expect.equals("T", ai.te.id);
  ai.test();
}
