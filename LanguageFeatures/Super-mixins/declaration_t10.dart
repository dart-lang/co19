// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin declaration defines an interface. The interface for this
/// mixin declaration is equivalent to the interface of the class declared as:
///  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
///    implements D, E { body' }
/// where body' contains abstract declarations corresponding to the instance
/// members of body of the mixin A.
/// It is a compile time error for the mixin declaration if this class
/// declarations would not be valid.
///
/// @description Checks that a mixin declaration in form
/// mixin A<X extends S, Y extends T> on B, C implements D, E { body }
/// is equivalent to the interface of the class declared as
/// abstract class A<X extends S, Y extends T> extends A$super<X, Y>
///   implements D, E { body' }
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
  new AI1();
  new AI2();
  new AI3();
  new AI4();
}
