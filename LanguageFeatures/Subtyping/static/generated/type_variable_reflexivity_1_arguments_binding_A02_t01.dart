// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Type Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
/// variables X0 & S0 and T1 is X0
/// @description Check that if type T0 a promoted type variables X0 & S0 and T1
/// is X0 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/type_variable_reflexivity_1_A02.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class X0 {
  const X0();
}
class S0 extends X0 {
}

S0 t0Instance = new S0();

const t1Default = const X0();

namedArgumentsFunc1(X0 t1, {X0 t2 = t1Default}) {}
positionalArgumentsFunc1(X0 t1, [X0 t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(X0 t1) {}

  ArgumentsBindingClass.named(X0 t1, {X0 t2 = t1Default}) {}
  ArgumentsBindingClass.positional(X0 t1, [X0 t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(X0 t1, {X0 t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(X0 t1, [X0 t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(X0 t1, {X0 t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(X0 t1, [X0 t2 = t1Default]) {}

  namedArgumentsMethod(X0 t1, {X0 t2 = t1Default}) {}
  positionalArgumentsMethod(X0 t1, [X0 t2 = t1Default]) {}

  set testSetter(X0 val) {}
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

test<T>(T t0Instance) {
  if (t0Instance is S0) {
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
    namedArgumentsFunc2<X0>(t0Instance, t2: t0Instance);

    // test generic class constructors
    ArgumentsBindingGen<X0> instance2 = new ArgumentsBindingGen<X0>(t0Instance);
    instance2 = new ArgumentsBindingGen<X0>.fNamed(t0Instance, t2: t0Instance);
    instance2 = new ArgumentsBindingGen<X0>.named(t0Instance, t2: t0Instance);

    // test generic class methods and setters
    instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
    instance2.testSetter = t0Instance;
  }
}

main() {
  test<S0>(t0Instance);
}
