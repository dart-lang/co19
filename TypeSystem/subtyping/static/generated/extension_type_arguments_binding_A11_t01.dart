// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that an extension type `ET` that implements `S` is a
/// subtype of `FutureOr<S>`.
/// @author sgrekhov22@gmail.com
/// @issue 55578
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A11.dart and
/// test_cases/arguments_binding_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import "dart:async";

extension type ET(Future<int> _) implements Future<int> {}

ET t0Instance = ET(Future<int>(() => 2));

const t1Default = 42;

namedArgumentsFunc1(FutureOr<int> t1, {FutureOr<int> t2 = t1Default}) {}
positionalArgumentsFunc1(FutureOr<int> t1, [FutureOr<int> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(FutureOr<int> t1) {}

  ArgumentsBindingClass.named(FutureOr<int> t1, {FutureOr<int> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(FutureOr<int> t1, [FutureOr<int> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(FutureOr<int> t1, {FutureOr<int> t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(FutureOr<int> t1, [FutureOr<int> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(FutureOr<int> t1, {FutureOr<int> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(FutureOr<int> t1, [FutureOr<int> t2 = t1Default]) {}

  namedArgumentsMethod(FutureOr<int> t1, {FutureOr<int> t2 = t1Default}) {}
  positionalArgumentsMethod(FutureOr<int> t1, [FutureOr<int> t2 = t1Default]) {}

  set testSetter(FutureOr<int> val) {}
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
  namedArgumentsFunc2<FutureOr<int>>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<FutureOr<int>> instance2 = new ArgumentsBindingGen<FutureOr<int>>(t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<int>>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<FutureOr<int>>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
}
