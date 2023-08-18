// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Object: if T1 is Object then:
///  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
///      B <: Object
///  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
///  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
///  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
///  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
///      hold (per above, the result of the subtyping query is false).
///  - Otherwise T0 <: T1 is true.
/// @description Check that if T0 is FutureOr<S> for some S but S is not subtype
/// of Object then T0 is not subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1. Assignment to static and instance class
/// variables is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/right_object_fail_A05.dart and
/// test_cases/class_member_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// Requirements=nnbd-weak
import "dart:async";
import "../../utils/legacy_lib.dart";

FutureOr<X?> t0Instance = new X();

const t1Default = const Object();

class ClassMemberTestStatic {
  static Object s = t1Default;

  ClassMemberTestStatic(FutureOr<X?> val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    s = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static set staticSetter(FutureOr<X?> val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static Object get staticGetter => t0Instance;
//                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPublic {
  Object m = t1Default;

  ClassMemberTestPublic(FutureOr<X?> val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(FutureOr<X?> val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(FutureOr<X?> val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  Object get getter => t0Instance;
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPrivate {
  Object _m = t1Default;

  ClassMemberTestPrivate(FutureOr<X?> val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(FutureOr<X?> val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(FutureOr<X?> val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class ClassMemberTestInitFail {
  static Object s = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object m = t0Instance;
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
