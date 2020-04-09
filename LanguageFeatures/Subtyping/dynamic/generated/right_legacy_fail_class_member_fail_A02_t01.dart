/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Legacy T1 is S1* then:
 * - T0 <: T1 iff T0 <: S1?
 * @description Check that if type T1 is S1* and T0 is not subtype of S1? then
 * T0 is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_legacy_fail_A02.dart and 
 * class_member_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

class C extends X {}

C t0Instance = new C();
Y t1Instance = new Y();

const t1Default = const Y();





class ClassMemberTestStatic {
  static Y s = t1Default;

  ClassMemberTestStatic(dynamic val) {
    s = val;
  }

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(dynamic val) {
    s = val;
  }

  static Y get staticGetter => forgetType(t0Instance);
}

class ClassMemberTestPublic {
  Y m = t1Default;

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

  Y get getter => forgetType(t0Instance);
}

class ClassMemberTestPrivate {
  Y _m = t1Default;

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
  static Y s = forgetType(t0Instance);
  Y m = forgetType(t0Instance);
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




test<T extends X>(T t0Instance) {


  // Test initialization
  Expect.throws(() {ClassMemberTestInitFail.s;}, (e) => e is TypeError || e is CastError);
  Expect.throws(() {new ClassMemberTestInitFail();}, (e) => e is TypeError || e is CastError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestPublic(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestPublic.short(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestPrivate.short(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError || e is CastError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).test(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t1Instance).test(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  // Test getters
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).getter;
  }, (e) => e is TypeError || e is CastError);


  // Test static stuff
  Expect.throws(() {
    new ClassMemberTestStatic(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    ClassMemberTestStatic.staticSetter = t0Instance;
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    ClassMemberTestStatic.staticGetter;
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    ClassMemberTestStatic.staticTest();
  }, (e) => e is TypeError || e is CastError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  // Test getters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Y>(t1Instance).getter;
  }, (e) => e is TypeError || e is CastError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Y>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Y>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Y>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Y>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError || e is CastError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Y>(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Y>(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPublic<Y>.short(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Y>(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Y>.short(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);
  //# -->

}

main() {
  test<C>(t0Instance);
}
