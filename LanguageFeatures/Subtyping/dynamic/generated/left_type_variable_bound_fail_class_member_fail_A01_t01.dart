// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Type Variable Bound: T0 is a type variable X0 with bound B0
///   and B0 <: T1
/// @description Check that if T0 is a type variable X0 with bound B0 and
/// B0 is not a subtype of T1 then T0 is not a subtype of a type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_type_variable_bound_fail_A01.dart and 
/// test_cases/class_member_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class T1 {
  const T1();
}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();

const t1Default = const T1();

class ClassMemberTestStatic {
  static T1 s = t1Default;

  ClassMemberTestStatic(dynamic val) {
    s = val;
  }

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(dynamic val) {
    s = val;
  }

  static T1 get staticGetter => forgetType(t0Instance);
}

class ClassMemberTestPublic {
  T1 m = t1Default;

  ClassMemberTestPublic(dynamic val) {
    m = val;
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(dynamic val) {
    m = val;
  }

  set setter(dynamic val) {
    m = val;
  }

  T1 get getter => forgetType(t0Instance);
}

class ClassMemberTestPrivate {
  T1 _m = t1Default;

  ClassMemberTestPrivate(dynamic val) {
    _m = val;
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(dynamic val) {
    _m = val;
  }

  set setter(dynamic val) {
    _m = val;
  }
}

class ClassMemberTestInitFail {
  static T1 s = forgetType(t0Instance);
  T1 m = forgetType(t0Instance);
}

class ClassMemberTestGenericPublic<X> {
  X m;

  ClassMemberTestGenericPublic(dynamic val): m = val {
  }

  ClassMemberTestGenericPublic.short(this.m);

  test(dynamic val) {
    m = val;
  }

  set setter(dynamic val) {
    m = val;
  }

  X get getter => forgetType(t0Instance);
}

class ClassMemberTestGenericPrivate<X> {
  X _m;

  ClassMemberTestGenericPrivate(dynamic val): _m = val {
  }

  ClassMemberTestGenericPrivate.short(this._m);

  test(dynamic val) {
    _m = val;
  }

  set setter(dynamic val) {
    _m = val;
  }
}

main() {
  // Test initialization
  Expect.throws(() {ClassMemberTestInitFail.s;}, (e) => e is TypeError);
  Expect.throws(() {new ClassMemberTestInitFail();}, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestPublic(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPublic.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  // Test getters
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).getter;
  }, (e) => e is TypeError);

  // Test static stuff
  Expect.throws(() {
    new ClassMemberTestStatic(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticSetter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticGetter;
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticTest();
  }, (e) => e is TypeError);

  // Test type parameters

  // Test getters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<T1>(t1Instance).getter;
  }, (e) => e is TypeError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestGenericPublic<T1>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<T1>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<T1>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<T1>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestGenericPublic<T1>(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestGenericPublic<T1>(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPublic<T1>.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<T1>(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<T1>.short(forgetType(t0Instance));
  }, (e) => e is TypeError);
}
