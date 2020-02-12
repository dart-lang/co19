/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Interface Compositionality: T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
 * @description Check that if type T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and not all of Si <: Ui then T0 is
 * not a subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from interface_compositionality_fail_A01.dart and 
 * class_member_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends U1 {}
// no subtype relation between S2 and U2
abstract class S2 {}

class C0<X, Y, Z> {
  const C0();
}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();

const t1Default = const C0<U0, U1, U2>();




class ClassMemberTestStatic {
  static C0<U0, U1, U2> s = t1Default;

  ClassMemberTestStatic(dynamic val) {
    s = val;
  }

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(dynamic val) {
    s = val;
  }

  static C0<U0, U1, U2> get staticGetter => forgetType(t0Instance);
}

class ClassMemberTestPublic {
  C0<U0, U1, U2> m = t1Default;

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

  C0<U0, U1, U2> get getter => forgetType(t0Instance);
}

class ClassMemberTestPrivate {
  C0<U0, U1, U2> _m = t1Default;

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
  static C0<U0, U1, U2> s = forgetType(t0Instance);
  C0<U0, U1, U2> m = forgetType(t0Instance);
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
    new ClassMemberTestGenericPublic<C0<U0, U1, U2>>(t1Instance).getter;
  }, (e) => e is TypeError || e is CastError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestGenericPublic<C0<U0, U1, U2>>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<C0<U0, U1, U2>>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<C0<U0, U1, U2>>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<C0<U0, U1, U2>>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError || e is CastError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestGenericPublic<C0<U0, U1, U2>>(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestGenericPublic<C0<U0, U1, U2>>(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPublic<C0<U0, U1, U2>>.short(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<C0<U0, U1, U2>>(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<C0<U0, U1, U2>>.short(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
