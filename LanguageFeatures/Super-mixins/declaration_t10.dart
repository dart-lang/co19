// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `MS` be the interface declared by the class declaration
/// ```
/// abstract class Msuper<P1, ..., Pm> implements T1, ..., Tn {}
/// ```
/// where `Msuper` is a fresh name. It is a compile-time error for the mixin
/// declaration if the `MS` class declaration would cause a compile-time error,
/// that is, if any member is declared by more than one declared superinterface,
/// and there is not a most specific signature for that member among the super
/// interfaces. The interface `MS` is called the superinvocation interface of
/// the mixin declaration `M`. If the mixin declaration `M` has only one
/// declared superinterface, `T1`, then the superinvocation interface `MS` has
/// exactly the same members as the interface `T1`.
///
/// Let `MI` be the interface that would be defined by the class declaration
/// ```
/// abstract class N<X1extendsB1, ..., Xs extends Bs>
///       implements T1, ..., Tn, I1, ..., Ik { members′ }
/// ```
/// ...
/// The interface introduced by the mixin declaration `M` has the same member
/// signatures and superinterfaces as `MI`.
///
/// @description Checks that a mixin declaration in the form
/// ```
/// mixin A<X extends S, Y extends T> on B, C implements D, E { body }
/// ```
/// has the same member signatures and superinterfaces as
/// ```
/// abstract class A<X extends S, Y extends T> extends MS<X, Y>
///       implements D, E { body' }
/// ```
/// @author sgrekhov@unipro.ru

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

mixin A on B, C implements D, E {
}

class AI1 implements A {
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // missing b
  String get c => "AI";
  String get d => "AI";
  String get e => "AI";
}
class AI2 implements A {
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // missing c
  String get b => "AI";
  String get d => "AI";
  String get e => "AI";
}
class AI3 implements A {
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // missing d
  String get b => "AI";
  String get c => "AI";
  String get e => "AI";
}
class AI4 implements A {
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // missing e
  String get b => "AI";
  String get c => "AI";
  String get d => "AI";
}

main() {
  print(AI1);
  print(AI2);
  print(AI3);
  print(AI4);
}
