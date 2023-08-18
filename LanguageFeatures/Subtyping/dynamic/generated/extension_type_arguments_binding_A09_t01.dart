// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that T1, .. Ts are types, and V resolves to an extension type
/// declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// It is then allowed to use V<T1, .. Tk> as a type.
///
/// @description Check that at run time an extension type is identical to its
/// representation type
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A09.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

import '../../utils/common.dart';

extension type const V<T>(T id) {}

String t0Instance = "1";

const t1Default = V<String>("0");

namedArgumentsFunc1(V<String> t1, {V<String> t2 = t1Default}) {}
positionalArgumentsFunc1(V<String> t1, [V<String> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(V<String> t1) {}

  ArgumentsBindingClass.named(V<String> t1, {V<String> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(V<String> t1, [V<String> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(V<String> t1, {V<String> t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(V<String> t1, [V<String> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(V<String> t1, {V<String> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(V<String> t1, [V<String> t2 = t1Default]) {}

  namedArgumentsMethod(V<String> t1, {V<String> t2 = t1Default}) {}
  positionalArgumentsMethod(V<String> t1, [V<String> t2 = t1Default]) {}

  set testSetter(V<String> val) {}
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
  namedArgumentsFunc2<V<String>>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<V<String>> instance2 =
      new ArgumentsBindingGen<V<String>>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<V<String>>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<V<String>>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
