/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is S1 and a type T0 is X0 and X0 has
 * bound S0 and S0 <: S1, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_A04.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class S1 {
  const S1();
}
class S0 extends S1 {
}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new S1();

const t1Default = const S1();




namedArgumentsFunc1(FutureOr<S1> t1, {FutureOr<S1> t2 = t1Default}) {}
positionalArgumentsFunc1(FutureOr<S1> t1, [FutureOr<S1> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(FutureOr<S1> t1) {}

  ArgumentsBindingClass.named(FutureOr<S1> t1, {FutureOr<S1> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(FutureOr<S1> t1, [FutureOr<S1> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(FutureOr<S1> t1, {FutureOr<S1> t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(FutureOr<S1> t1, [FutureOr<S1> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(FutureOr<S1> t1, {FutureOr<S1> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(FutureOr<S1> t1, [FutureOr<S1> t2 = t1Default]) {}

  namedArgumentsMethod(FutureOr<S1> t1, {FutureOr<S1> t2 = t1Default}) {}
  positionalArgumentsMethod(FutureOr<S1> t1, [FutureOr<S1> t2 = t1Default]) {}

  set testSetter(FutureOr<S1> val) {}
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
  namedArgumentsFunc2<FutureOr<S1>>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<FutureOr<S1>> instance2 = new ArgumentsBindingGen<FutureOr<S1>>(t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<S1>>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<S1>>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
  //# -->
}
