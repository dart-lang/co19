/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a class [C] in an opted-in library implements the same
 * generic class [I] more than once as [I0], .., [In], and at least one of the
 * [Ii] is not syntactically equal to the others, then it is an error if
 * [NNBD_TOP_MERGE(S0, ..., Sn)] is not defined where [Si] is [NORM(Ii)].
 * Otherwise, for the purposes of runtime subtyping checks, [C] is considered to
 * implement the canonical interface given by [NNBD_TOP_MERGE(S0, ..., Sn)].
 *
 * If a class [C] in an opted-in library overrides a member, it is an error if
 * its signature is not a subtype of the types of all overriden members from all
 * super-interfaces (whether legacy or opted-in). For the purposes of override
 * checking, members which are inherited from opted-in classes through legacy
 * classes are still checked against each original declaration at its opted-in
 * type. For example, the following override is considered an error.
 *
 *  // opted_in.dart
 *  class A {
 *      int foo(int? x) {}
 *  }
 *  // opted_out.dart
 *  // @dart = 2.6
 *  import 'opted_in.dart';
 *
 * class B extends A {}
 *  // opted_in.dart
 *  class C extends B {
 *  // Override checking is done against the opted-in signature of A.foo
 *  int? foo(int x) {}
 *  }
 *
 * @description  Check that if legacy class inherits a field from two opted in
 * classes with contradictory nullability information and than this field is
 * inherited again in the opted in code, compile error appears.
 *
 * @Issue 40414,41529
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "override_checking_A03_opted_out_lib.dart";

class A extends LEGACY_FIELDS_2 {
  int?      i;
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  Object?   o;
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  Function? f;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

void testme() {}

class B extends LEGACY_FIELDS_2 {
  int      i = 1;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  Object   o = 1;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  Function f = testme;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  A();
  B();
}
