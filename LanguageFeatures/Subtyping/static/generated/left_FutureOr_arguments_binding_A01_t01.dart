// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left FutureOr: T0 is FutureOr<S0>
///   and Future<S0> <: T1
///   and S0 <: T1
/// @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
/// are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
/// when an instance of T0 is an instance of S0 type.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_FutureOr_A01.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import "dart:async";

class C {
  const C();
}
class S0 extends C {}

FutureOr<S0> t0Instance = new S0();

const t1Default = const C();

namedArgumentsFunc1(FutureOr<C> t1, {FutureOr<C> t2 = t1Default}) {}
positionalArgumentsFunc1(FutureOr<C> t1, [FutureOr<C> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(FutureOr<C> t1) {}

  ArgumentsBindingClass.named(FutureOr<C> t1, {FutureOr<C> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(FutureOr<C> t1, [FutureOr<C> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(FutureOr<C> t1, {FutureOr<C> t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(FutureOr<C> t1, [FutureOr<C> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(FutureOr<C> t1, {FutureOr<C> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(FutureOr<C> t1, [FutureOr<C> t2 = t1Default]) {}

  namedArgumentsMethod(FutureOr<C> t1, {FutureOr<C> t2 = t1Default}) {}
  positionalArgumentsMethod(FutureOr<C> t1, [FutureOr<C> t2 = t1Default]) {}

  set testSetter(FutureOr<C> val) {}
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
  namedArgumentsFunc2<FutureOr<C>>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<FutureOr<C>> instance2 = new ArgumentsBindingGen<FutureOr<C>>(t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<C>>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<C>>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
}
