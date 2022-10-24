// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Object: if T1 is Object then:
///  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
///      B <: Object
///  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
///  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
///  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
///  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does
///      not hold (per above, the result of the subtyping query is false).
///  - Otherwise T0 <: T1 is true.
/// @description Check that if T0 is FutureOr<S> for some S and S <: Object then
/// T0 is subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_object_A04.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

import "dart:async";

class S {}

FutureOr<S> t0Instance = new Future.value(new S());

const t1Default = const Object();

namedArgumentsFunc1(Object t1, {Object t2 = t1Default}) {}
positionalArgumentsFunc1(Object t1, [Object t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(Object t1) {}

  ArgumentsBindingClass.named(Object t1, {Object t2 = t1Default}) {}
  ArgumentsBindingClass.positional(Object t1, [Object t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(Object t1, {Object t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(Object t1, [Object t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(Object t1, {Object t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(Object t1, [Object t2 = t1Default]) {}

  namedArgumentsMethod(Object t1, {Object t2 = t1Default}) {}
  positionalArgumentsMethod(Object t1, [Object t2 = t1Default]) {}

  set testSetter(Object val) {}
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
  namedArgumentsFunc2<Object>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<Object> instance2 =
      new ArgumentsBindingGen<Object>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<Object>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<Object>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
