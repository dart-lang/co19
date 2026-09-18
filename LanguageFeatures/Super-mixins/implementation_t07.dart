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
/// that implement all required interfaces. Test the case when mixin declaration
/// is applied to the class which mixins only one of the interfaces.
/// @author sgrekhov@unipro.ru

mixin class B {
  String get gb1 => "B.gb1";
}
abstract class C {
  String get gc1;
}

class A extends Object with B {
  String get gc1 => "A.gc1";
}

mixin M on B, C {}

class MA extends A with M {
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(MA);
}
