// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
/// Positional Function Types: T0 is U0 Function<X0 extends B00, ... ,
/// Xk extends B0k>(V0 x0, ..., Vn xn, [Vn+1 xn+1, ..., Vm xm])
///
///  and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
///  Sp yp, [Sp+1 yp+1, ..., Sq yq])
///  and p >= n
///  and m >= q
///  and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...q
///  and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
///  and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
///  where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
///
/// @description Check that if p < n and m > q then T0 is not a subtype of T1.
/// Test generic types.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the superclass member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/positional_function_types_fail_A06.dart and 
/// test_cases/class_member_fail_x02.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class A {}

class C extends A {}

class U0<X, Y, Z> extends U1<X, Y, Z> {}

class U1<X, Y, Z> {}

class B0<X, Y, Z> {}

class B1<X, Y, Z> {}

class V0<X, Y, Z> {}

class V1<X, Y, Z> {}

class V2<X, Y, Z> {}

class V3<X, Y, Z> {}

class S0<X, Y, Z> extends V0<X, Y, Z> {}

class S1<X, Y, Z> extends V1<X, Y, Z> {}

class S2<X, Y, Z> extends V2<X, Y, Z> {}

class S3<X, Y, Z> extends V3<X, Y, Z> {}

typedef T0 = U0<C, List<String>, int> Function<X extends B0, Y extends B1>(
    V0<A, List, num> x0, V1<A, List, num> x1,
    [V2<A, List, num>? x2, V3<A, List, num>? x3]);
typedef T1 = U1<A, List, num> Function<X extends B0, Y extends B1>(
    S0<C, List<String>, int> y0, [S1<C, List<String>, int>? y1,
    S2<C, List<String>, int>? y2, S3<C, List<String>, int>? y3]);

U0<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
        V0<A, List, num> x0, V1<A, List, num> x1,
        [V2<A, List, num>? x2, V3<A, List, num>? x3]) =>
    new U0<C, List<String>, int>();
U1<A, List, num> t1Func<X extends B0, Y extends B1>(
        S0<C, List<String>, int> y0, [S1<C, List<String>, int>? y1,
        S2<C, List<String>, int>? y2, S3<C, List<String>, int>? y3]) =>
    new U1<A, List, num>();

T0 t0Instance = t0Func;
const t1Default = t1Func;

class ClassMemberSuper1_t02 {
  T1 m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(T1 val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {

  ClassMember1_t02() : super(forgetType(t0Instance)) {}

  ClassMember1_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember1_t02.short() : super.short(forgetType(t0Instance));

  ClassMember1_t02.valid() : super(null);

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t02<X> {
  X m;

  ClassMemberSuper2_t02(X value): m = value {
  }

  ClassMemberSuper2_t02.named(X value): m = value {
  }

  ClassMemberSuper2_t02.short(this.m);

  void set superSetter(X val) {}
}

class ClassMember2_t02<X> extends ClassMemberSuper2_t02<X> {

  ClassMember2_t02() : super(forgetType(t0Instance)) {}

  ClassMember2_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember2_t02.short() : super.short(forgetType(t0Instance));

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {
    new ClassMember1_t02();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.short();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.named();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().test2();
  }, (e) => e is TypeError);

  // Test type parameters

  Expect.throws(() {
    new ClassMember2_t02<T1>();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<T1>.short();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<T1>.named();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<T1>().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<T1>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<T1>().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<T1>().test2();
  }, (e) => e is TypeError);
}
