// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

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
/// @description Check that if T0 isn't a subtype of T1 if
/// B0i[Z0/X0, ..., Zk/Xk] !== B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from positional_function_types_fail_A31.dart and 
/// local_variable_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';


class U0 extends U1 {}

class U1 {}

class B0 {}

class B1 {}

class V0 {}

class V1 {}

class V2 {}

class V3 {}

class V4 {}

class S0 extends V0 {}

class S1 extends V1 {}

class S2 extends V2 {}

class S3 extends V3 {}

typedef T0 = U0 Function<X extends B0, Y extends B1>(V0 x0, V1 x1,
    [V2 x2, V3 x3, V4 x4]);
typedef T1 = U1 Function<X extends B0, Y extends B0>(S0 y0, S1 y1,
    [S2 x2, S3 x3]); //  Y extends B0, not B1

U0 t0Func<X extends B0, Y extends B1>(V0 x0, V1 x1, [V2 x2, V3 x3, V4 x4]) =>
    null;
U1 t1Func<X extends B0, Y extends B0>(S0 y0, S1 y1, [S2 x2, S3 x3]) => null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;

// @dart = 2.9



class LocalVariableTest {

  LocalVariableTest() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }

  LocalVariableTest.valid() {}

  static staticTest() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }

  test() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }
}

main() {
  bar () {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }

  Expect.throws(() {
    T1 t1 = null;
    t1 = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest.valid().test();
  }, (e) => e is TypeError);

  Expect.throws(() {
    LocalVariableTest.staticTest();
  }, (e) => e is TypeError);
}

