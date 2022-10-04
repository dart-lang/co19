// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left FutureOr: T0 is FutureOr<S0>
///   and Future<S0> <: T1
///   and S0 <: T1
/// @description Check that if a type T0 is FutureOr<S0> and S0 is a subtype of
/// T1 but Future<S0> is not a subtype of T1 , then a type T0 is not a subtype of
/// a type T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1. Assignment to static and instance class
/// variables is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/left_FutureOr_fail_A04.dart and 
/// test_cases/class_member_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import "dart:async";

FutureOr? t0Instance = Future.value(42);
Future? t1Instance = Future.value(42);

const t1Default = null;

class ClassMemberTestStatic {
  static Future? s = t1Default;

  ClassMemberTestStatic(FutureOr? val) {
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

  static set staticSetter(FutureOr? val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static Future? get staticGetter => t0Instance;
//                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPublic {
  Future? m = t1Default;

  ClassMemberTestPublic(FutureOr? val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(FutureOr? val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(FutureOr? val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  Future? get getter => t0Instance;
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPrivate {
  Future? _m = t1Default;

  ClassMemberTestPrivate(FutureOr? val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(FutureOr? val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(FutureOr? val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class ClassMemberTestInitFail {
  static Future? s = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Future? m = t0Instance;
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
