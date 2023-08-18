// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that if type `T0` is an extension type `V` with type
/// parameters `X1 .. Xs`, and `V1` is a superinterface of `V`, then `V` is a
/// subtype of `[T1/X1 .. Ts/Xs]V1` for all `T1, .. Ts`.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A04.dart and
/// test_cases/arguments_binding_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

import '../../utils/common.dart';

extension type const V1<T1, T2>(T1 id) {}

extension type V<T1, T2>(T1 id) implements V1<T1, T2> {}

V<int, String> t0Instance = V<int, String>(42);

const t1Default = const V1<num, Object>(0);

namedArgumentsFunc1(V1<num, Object> t1, {V1<num, Object> t2 = t1Default}) {}
positionalArgumentsFunc1(V1<num, Object> t1, [V1<num, Object> t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(V1<num, Object> t1) {}

  ArgumentsBindingClass.named(V1<num, Object> t1, {V1<num, Object> t2 = t1Default}) {}
  ArgumentsBindingClass.positional(V1<num, Object> t1, [V1<num, Object> t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(V1<num, Object> t1, {V1<num, Object> t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(V1<num, Object> t1, [V1<num, Object> t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(V1<num, Object> t1, {V1<num, Object> t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(V1<num, Object> t1, [V1<num, Object> t2 = t1Default]) {}

  namedArgumentsMethod(V1<num, Object> t1, {V1<num, Object> t2 = t1Default}) {}
  positionalArgumentsMethod(V1<num, Object> t1, [V1<num, Object> t2 = t1Default]) {}

  set testSetter(V1<num, Object> val) {}
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
  namedArgumentsFunc2<V1<num, Object>>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<V1<num, Object>> instance2 =
      new ArgumentsBindingGen<V1<num, Object>>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<V1<num, Object>>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<V1<num, Object>>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
