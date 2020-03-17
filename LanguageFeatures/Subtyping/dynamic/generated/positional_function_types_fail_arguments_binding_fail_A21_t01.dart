/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Positional Function Types: T0 is U0 Function<X0 extends B00, ... ,
 * Xk extends B0k>(V0 x0, ..., Vn xn, [Vn+1 xn+1, ..., Vm xm])
 *
 *  and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
 *  Sp yp, [Sp+1 yp+1, ..., Sq yq])
 *  and p >= n
 *  and m >= q
 *  and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...q
 *  and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 *  and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 *  where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 *
 * @description Check that if T0 isn't a subtype of T1 if U0[Z0/X0, ..., Zk/Xk]
 * isn't a subtype of U1[Z0/Y0, ..., Zk/Yk].
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from positional_function_types_fail_A21.dart and 
 * arguments_binding_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
class U0 {} // U0 is not subtype of U1
class U1 {}
class V0 {}
class V1 {}
class V2 {}
class V3 {}
class S0 extends V0 {}
class S1 extends V1 {}
class S2 extends V2 {}
class S3 extends V3 {}

typedef T0 = U0 Function(V0 x0, V1 x1, [V2? x2, V3? x3]);
typedef T1 = U1 Function(S0 y0, S1 y1, [S2? y2, S3? y3]);

U0 t0Func(V0 x0, V1 x1, [V2? x2, V3? x3]) => new U0();
U1 t1Func(S0 y0, S1 y1, [S2? y2, S3? y3]) => new U1();

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;
const t1Default = t1Func;



namedArgumentsFunc1(T1 t1, {T1 t2 = t1Default}) {}
positionalArgumentsFunc1(T1 t1, [T1 t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(T1 t1) {}

  ArgumentsBindingClass.named(T1 t1, {T1 t2 = t1Default}) {}

  factory ArgumentsBindingClass.fNamed(T1 t1, {T1 t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(T1 t1, [T1 t2 = t1Default]) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }

  static namedArgumentsStaticMethod(T1 t1, {T1 t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(T1 t1, [T1 t2 = t1Default]) {}

  namedArgumentsMethod(T1 t1, {T1 t2 = t1Default}) {}
  positionalArgumentsMethod(T1 t1, [T1 t2 = t1Default]) {}

  set testSetter(T1 val) {}
}

class ArgumentsBindingClassGen<X> {
  ArgumentsBindingClassGen(X t1) {}

  ArgumentsBindingClassGen.named(X t1, {required X t2}) {}

  factory ArgumentsBindingClassGen.fNamed(X t1, {required X t2}) {
    return new ArgumentsBindingClassGen.named(t1, t2: t2);
  }

  namedArgumentsMethod(X t1, {required X t2}) {}

  set testSetter(X val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(T1 t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(T0 t0) : super (forgetType(t0)) {}
}

main() {
  // Test functions
  Expect.throws(() {
    namedArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    namedArgumentsFunc1(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    positionalArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    positionalArgumentsFunc1(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClass(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  // Test static methods
  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  // Test generic functions
  Expect.throws(() {
    namedArgumentsFunc2<T1>(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);


  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>(t1Instance).namedArgumentsMethod(t1Instance,
    t2: forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  //# -->

  // Test superclass constructor call
  Expect.throws(() {
    new ArgumentsBindingDesc(t0Instance);
  }, (e) => e is TypeError || e is CastError);
}
