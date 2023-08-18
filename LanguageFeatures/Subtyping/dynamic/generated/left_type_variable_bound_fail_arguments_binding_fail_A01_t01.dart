// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Type Variable Bound: T0 is a type variable X0 with bound B0
///   and B0 <: T1
/// @description Check that if T0 is a type variable X0 with bound B0 and
/// B0 is not a subtype of T1 then T0 is not a subtype of a type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_type_variable_bound_fail_A01.dart and
/// test_cases/arguments_binding_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class T1 {
  const T1();
}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();

const t1Default = const T1();

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
  ArgumentsBindingDesc(X0 t0) : super (forgetType(t0)) {}
}

main() {
  // Test functions
  Expect.throws(() {
    namedArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc1(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClass(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test static methods
  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test type parameters

  // Test generic functions
  Expect.throws(() {
    namedArgumentsFunc2<T1>(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>(t1Instance).namedArgumentsMethod(t1Instance,
    t2: forgetType(t0Instance));
    }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<T1>(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test superclass constructor call
  Expect.throws(() {
    new ArgumentsBindingDesc(t0Instance);
  }, (e) => e is TypeError);
}
