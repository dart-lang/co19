// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  A type T is malformed iff:
/// • T has the form id or the form prefix.id, and in the enclosing lexical
///   scope, the name id (respectively prefix.id) does not denote a type.
/// • T denotes a type variable in the enclosing lexical scope, but occurs in
///   the signature or body of a static member.
/// • T is a parameterized type of the form G<S1, ..., Sn>, and G is malformed.
/// • T denotes declarations that were imported from multiple imports clauses.
/// Any use of a malformed type gives rise to a static warning. A malformed type
/// is then interpreted as dynamic by the static type checker and the runtime
/// unless explicitly specified otherwise.
///
/// @description Checks that it is a compile error if a malformed type is
/// used in a subtype test.
/// @author kaigorodov

class C<T, U, V> {}
class Bounded<T extends num> {}
class BoundedInt<T extends int> {}

main() {
  null is UnknownType;
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

// C<int, double, UnknownType> is not malformed, see
// (Types/Parameterized Types)
// UnknownType is treated as dynamic and parameterized type is
// C<int,double,dynamic>

  C<int, double, UnknownType> x = new C();
//               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  null is C<int, double, UnknownType>;
//                       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Bounded<String> x2 = new Bounded();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  BoundedInt<num> x3 = new BoundedInt();
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  C<Bounded<String>, C, C> x4 = new C();
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C<C<UnknownType, int, int>, C, C> x5 = new C();
//    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
