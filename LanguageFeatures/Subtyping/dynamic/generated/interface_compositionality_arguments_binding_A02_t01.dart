// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Interface Compositionality: T0 is an interface type
/// C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
/// @description Check that if type T0 is an interface type
/// C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui then T0 is a
/// subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/interface_compositionality_A02.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=class-modifiers

import '../../utils/common.dart';

abstract class U0 {}
abstract mixin class U1 {}
abstract mixin class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends Object with U1 {}
class S2 = Object with U2;

class C0<X, Y, Z> {
  const C0();
}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();

const t1Default = const C0<U0, U1, U2>();

namedArgumentsFunc1(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2 = t1Default}) {}
positionalArgumentsFunc1(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(C0<U0, U1, U2> t1) {}

  ArgumentsBindingClass.named(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2 = t1Default]) {}

  namedArgumentsMethod(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2 = t1Default}) {}
  positionalArgumentsMethod(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2 = t1Default]) {}

  set testSetter(C0<U0, U1, U2> val) {}
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

  // test generic functions
  namedArgumentsFunc2<C0<U0, U1, U2>>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<C0<U0, U1, U2>> instance2 =
      new ArgumentsBindingGen<C0<U0, U1, U2>>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<C0<U0, U1, U2>>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<C0<U0, U1, U2>>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
