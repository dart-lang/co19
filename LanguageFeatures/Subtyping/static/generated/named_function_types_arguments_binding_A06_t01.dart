// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
/// Named Function Types:
/// T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>(V0 x0, ..., Vn xn,
///   {r0n+1 Vn+1 xn+1, ..., r0m Vm xm}) where r0j is empty or required for j in
///   n+1...m
/// and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
///   Sn yn, {r1n+1 Sn+1 yn+1, ..., r1q Sq yq}) where r1j is empty or required
///   for j in n+1...q
/// and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
/// and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
/// and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
/// and for each j such that r0j is required, then there exists an i in n+1...q
///   such that xj = yi, and r1i is required
/// and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
/// and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
/// where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
///
/// @description Check that if `T0` has a named argument and `T1` has a required
/// named argument of the same type, then T0 is a subtype of T1.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/named_function_types_A06.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

typedef void F0({int i});
typedef void F1({required int i});

void f0Instance({int i = 0}) {}
void f1Instance({required int i}) {}

F0 t0Instance = f0Instance;

const t1Default = f1Instance;

namedArgumentsFunc1(F1 t1, {F1 t2 = t1Default}) {}
positionalArgumentsFunc1(F1 t1, [F1 t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(F1 t1) {}

  ArgumentsBindingClass.named(F1 t1, {F1 t2 = t1Default}) {}
  ArgumentsBindingClass.positional(F1 t1, [F1 t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(F1 t1, {F1 t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(F1 t1, [F1 t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(F1 t1, {F1 t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(F1 t1, [F1 t2 = t1Default]) {}

  namedArgumentsMethod(F1 t1, {F1 t2 = t1Default}) {}
  positionalArgumentsMethod(F1 t1, [F1 t2 = t1Default]) {}

  set testSetter(F1 val) {}
}

class ArgumentsBindingGen<X>  {
  ArgumentsBindingGen(X t1) {}

  ArgumentsBindingGen.named(X t1, {required X t2}) {}

  factory ArgumentsBindingGen.fNamed(X t1, {required X t2}) {
    return new ArgumentsBindingGen.named(t1, t2: t2);
  }

  namedArgumentsMethod(X t1, {required X t2}) {}

  set testSetter(X val) {}
}

main() {
  // test functions
  namedArgumentsFunc1(t0Instance, t2: t0Instance);
  positionalArgumentsFunc1(t0Instance, t0Instance);

  // test class constructors
  ArgumentsBindingClass instance1 = new ArgumentsBindingClass(t0Instance);
  instance1 = new ArgumentsBindingClass.fNamed(t0Instance, t2: t0Instance);
  instance1 = new ArgumentsBindingClass.fPositional(t0Instance, t0Instance);
  instance1 = new ArgumentsBindingClass.named(t0Instance, t2: t0Instance);
  instance1 = new ArgumentsBindingClass.positional(t0Instance, t0Instance);

  // tests methods and setters
  instance1.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance1.positionalArgumentsMethod(t0Instance, t0Instance);
  instance1.testSetter = t0Instance;

  // test static methods
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance, t2: t0Instance);
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance, t0Instance);

  // Test type parameters

  // test generic functions
  namedArgumentsFunc2<F1>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<F1> instance2 = new ArgumentsBindingGen<F1>(t0Instance);
  instance2 = new ArgumentsBindingGen<F1>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<F1>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
}
