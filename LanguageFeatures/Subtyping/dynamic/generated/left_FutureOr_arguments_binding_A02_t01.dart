/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
 * when an instance of T0 is an instance of Future<S0> type.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_A02.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class C {
  const C();
}
class S0 extends C {}

FutureOr<S0> t0Instance = new Future<S0>.value(new S0());
FutureOr<C> t1Instance = new Future<C>.value(new C());

const t1Default = const C();



namedArgumentsFunc1(FutureOr<C> t1, {FutureOr<C> t2 = t1Default}) {}
positionalArgumentsFunc1(FutureOr<C> t1, [FutureOr<C> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(FutureOr<C> t1) {}

  ArgumentsBindingClass.named(FutureOr<C> t1, {FutureOr<C> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(FutureOr<C> t1, [FutureOr<C> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(FutureOr<C> t1, {FutureOr<C> t2  = t1Default}) {
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
  namedArgumentsFunc1(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc1(forgetType(t0Instance), forgetType(t0Instance));

  // test class constructors
  ArgumentsBindingClass instance1 =
      new ArgumentsBindingClass(forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.positional(forgetType(t0Instance),
      forgetType(t0Instance));

  // tests methods and setters
  instance1.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1.positionalArgumentsMethod(forgetType(t0Instance),
      forgetType(t0Instance));
  instance1.testSetter = forgetType(t0Instance);

  // test static methods
  ArgumentsBindingClass.namedArgumentsStaticMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  ArgumentsBindingClass.positionalArgumentsStaticMethod(
      forgetType(t0Instance), forgetType(t0Instance));

  // Test type parameters

  //# <-- NotGenericFunctionType
  // test generic functions
  namedArgumentsFunc2<FutureOr<C>>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<FutureOr<C>> instance2 =
      new ArgumentsBindingGen<FutureOr<C>>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<FutureOr<C>>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<FutureOr<C>>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
  //# -->
}
