// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Null: if T0 is Null then:
/// - if T1 is a type variable (promoted or not) the query is false
/// - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
/// - If T1 is Null, S? or S* for some S, then the query is true.
/// - Otherwise, the query is false
/// @description Check that if type T0 is Null and T1 is FutureOr<S> for some S,
/// and Null is subtype of S then T0 is subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_null_A02.dart and
/// test_cases/arguments_binding_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

import "dart:async";

Null t0Instance = null;

const t1Default = null;

namedArgumentsFunc1(FutureOr<Null> t1, {FutureOr<Null> t2 = t1Default}) {}
positionalArgumentsFunc1(FutureOr<Null> t1, [FutureOr<Null> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(FutureOr<Null> t1) {}

  ArgumentsBindingClass.named(FutureOr<Null> t1, {FutureOr<Null> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(FutureOr<Null> t1, [FutureOr<Null> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(FutureOr<Null> t1, {FutureOr<Null> t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(FutureOr<Null> t1, [FutureOr<Null> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(FutureOr<Null> t1, {FutureOr<Null> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(FutureOr<Null> t1, [FutureOr<Null> t2 = t1Default]) {}

  namedArgumentsMethod(FutureOr<Null> t1, {FutureOr<Null> t2 = t1Default}) {}
  positionalArgumentsMethod(FutureOr<Null> t1, [FutureOr<Null> t2 = t1Default]) {}

  set testSetter(FutureOr<Null> val) {}
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
  namedArgumentsFunc2<FutureOr<Null>>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<FutureOr<Null>> instance2 =
      new ArgumentsBindingGen<FutureOr<Null>>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<FutureOr<Null>>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<FutureOr<Null>>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
