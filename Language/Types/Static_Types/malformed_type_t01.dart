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
/// @description Checks that it is a compile error if a malformed type is
/// used in a subtype test.
/// @author kaigorodov

class C<T, U, V> {}
class Bounded<T extends num> {}
class BoundedInt<T extends int> {}

main() {
  null is UnknownType;
//        ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_TEST_WITH_UNDEFINED_NAME
// [cfe] 'UnknownType' isn't a type.

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
// [analyzer] COMPILE_TIME_ERROR.NON_TYPE_AS_TYPE_ARGUMENT
// [cfe] 'UnknownType' isn't a type.
  Bounded<String> x2 = new Bounded();
//        ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
//^
// [cfe] Type argument 'String' doesn't conform to the bound 'num' of the type variable 'T' on 'Bounded'.
  BoundedInt<num> x3 = new BoundedInt();
//           ^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
//^
// [cfe] Type argument 'num' doesn't conform to the bound 'int' of the type variable 'T' on 'BoundedInt'.
  C<Bounded<String>, C, C> x4 = new C();
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C<C<UnknownType, int, int>, C, C> x5 = new C();
//    ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NON_TYPE_AS_TYPE_ARGUMENT
// [cfe] 'UnknownType' isn't a type.
}
