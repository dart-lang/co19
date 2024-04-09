// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that an extension type `ET<T1, ..., Ts>` is a subtype of
/// an extension type `ET<X1, ..., Xs>` if `Ti` is a subtype of `Xi` for all `i`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A08.dart and
/// test_cases/arguments_binding_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

extension type const ET<T>(T id) {}

ET<String> t0Instance = ET("42");

const t1Default = ET(Object());

namedArgumentsFunc1(ET<Object> t1, {ET<Object> t2 = t1Default}) {}
positionalArgumentsFunc1(ET<Object> t1, [ET<Object> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(ET<Object> t1) {}

  ArgumentsBindingClass.named(ET<Object> t1, {ET<Object> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(ET<Object> t1, [ET<Object> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(ET<Object> t1, {ET<Object> t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(ET<Object> t1, [ET<Object> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(ET<Object> t1, {ET<Object> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(ET<Object> t1, [ET<Object> t2 = t1Default]) {}

  namedArgumentsMethod(ET<Object> t1, {ET<Object> t2 = t1Default}) {}
  positionalArgumentsMethod(ET<Object> t1, [ET<Object> t2 = t1Default]) {}

  set testSetter(ET<Object> val) {}
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
  namedArgumentsFunc2<ET<Object>>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<ET<Object>> instance2 = new ArgumentsBindingGen<ET<Object>>(t0Instance);
  instance2 = new ArgumentsBindingGen<ET<Object>>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<ET<Object>>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
}
