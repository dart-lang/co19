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
/// @description Check that if type `T0` is an extension type `V<T1, .. Ts>` and
/// `T1` is an extension type `V<X1, .. Ss>` then `T0` is a subtype of `T1` if
/// all `Ti <: Xi`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A01.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

extension type const V<T1 extends num, T2 extends Object>(T1 id) {}

V<int, String> t0Instance = V<int, String>(42);

const t1Default = const V<num, Object>(0);

namedArgumentsFunc1(V<num, Object> t1, {V<num, Object> t2 = t1Default}) {}
positionalArgumentsFunc1(V<num, Object> t1, [V<num, Object> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(V<num, Object> t1) {}

  ArgumentsBindingClass.named(V<num, Object> t1, {V<num, Object> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(V<num, Object> t1, [V<num, Object> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(V<num, Object> t1, {V<num, Object> t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(V<num, Object> t1, [V<num, Object> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(V<num, Object> t1, {V<num, Object> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(V<num, Object> t1, [V<num, Object> t2 = t1Default]) {}

  namedArgumentsMethod(V<num, Object> t1, {V<num, Object> t2 = t1Default}) {}
  positionalArgumentsMethod(V<num, Object> t1, [V<num, Object> t2 = t1Default]) {}

  set testSetter(V<num, Object> val) {}
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
  namedArgumentsFunc2<V<num, Object>>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<V<num, Object>> instance2 = new ArgumentsBindingGen<V<num, Object>>(t0Instance);
  instance2 = new ArgumentsBindingGen<V<num, Object>>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<V<num, Object>>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
}
