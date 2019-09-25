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
 * when an instance of T0 is an instance of Future<S0> type and S0 is a generic
 * type
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_A04.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class A {}
class B extends A {}
class C<X> {
  const C();
}
class S0<X> extends C<X> {}

FutureOr<S0<B>> t0Instance = new Future<S0<B>>.value(new S0<B>());
FutureOr<C<A>> t1Instance = new Future<C<A>>.value(new C<A>());

const t1Default = const C<A>();




namedArgumentsFunc1(FutureOr<C<A>> t1, {FutureOr<C<A>> t2 = t1Default}) {}
positionalArgumentsFunc1(FutureOr<C<A>> t1, [FutureOr<C<A>> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(FutureOr<C<A>> t1) {}

  ArgumentsBindingClass.named(FutureOr<C<A>> t1, {FutureOr<C<A>> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(FutureOr<C<A>> t1, [FutureOr<C<A>> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(FutureOr<C<A>> t1, {FutureOr<C<A>> t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(FutureOr<C<A>> t1, [FutureOr<C<A>> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(FutureOr<C<A>> t1, {FutureOr<C<A>> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(FutureOr<C<A>> t1, [FutureOr<C<A>> t2 = t1Default]) {}

  namedArgumentsMethod(FutureOr<C<A>> t1, {FutureOr<C<A>> t2 = t1Default}) {}
  positionalArgumentsMethod(FutureOr<C<A>> t1, [FutureOr<C<A>> t2 = t1Default]) {}

  set testSetter(FutureOr<C<A>> val) {}
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

  //# <-- NotGenericFunctionType
  // test generic functions
  namedArgumentsFunc2<FutureOr<C<A>>>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<FutureOr<C<A>>> instance2 = new ArgumentsBindingGen<FutureOr<C<A>>>(t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<C<A>>>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<C<A>>>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
  //# -->
}
