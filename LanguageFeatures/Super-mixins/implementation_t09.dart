// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be a mixin declaration of the form
/// ```
/// mixin N<X1 extends B1, ..., Xs extends Bs> on T1, ..., Tn
///       implements I1, ..., Ik { members }
/// ```
/// ...
/// Let `MS` be the interface declared by the class declaration
/// ```
/// abstract class Msuper<P1, ..., Pm> implements T1, ..., Tn {}
/// ```
/// where `Msuper` is a fresh name.
/// ...
/// Let `MI` be the interface that would be defined by the class declaration
/// ```
/// abstract class N<X1 extends B1, ..., Xs extends Bs>
///       implements T1, ..., Tn, I1, ..., Ik { members′ }
/// ```
/// where `members′` are the member declarations of the mixin declaration `M`
/// except that all superinvocations are treated as if `super` was a valid
/// expression with static type `MS`. It is a compile-time error for the mixin
/// `M` if this `N` class declaration would cause a compile-time error, that is,
/// if the required superinterfaces, the implemented interfaces and the
/// declarations do not define a consistent interface, if any member declaration
/// contains a compile-time error other than a super-invocation, or if a
/// super-invocation is not valid against the interface `MS`.
///
/// @description Check that a mixin declaration can only be applied to classes
/// that implement all required interfaces. Test type parameters.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

abstract class I {
  int get gi1;
}

abstract class J {
  int get gj1;
}

abstract class B<X extends S> {
  int get gb1;
  X? x;
}
abstract class C<Y extends T> {
  int get gc1;
  Y? y;
}

class A implements B<X>, C<Y> {
  int get gb1 => 1;
  int get gc1 => 2;
  X? x = new X();
  Y? y = new Y();
}

mixin M<X extends S, Y extends T> on B<X>, C<Y> implements I, J {
  int get gi1 => 3;
  int get gj1 => 4;
}

class MA extends A with M<X, Y> {}

main() {
  MA ma = new MA();
  Expect.equals(1, ma.gb1);
  Expect.equals(2, ma.gc1);
  Expect.equals(3, ma.gi1);
  Expect.equals(4, ma.gj1);
  Expect.isTrue(ma.x is X);
  Expect.isTrue(ma.y is Y);
}
