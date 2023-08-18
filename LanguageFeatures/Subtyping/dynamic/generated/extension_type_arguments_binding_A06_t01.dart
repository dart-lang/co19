// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
///
/// Here is an overview of the subtype relationships of an extension type V0
/// with instantiated representation type R and instantiated superinterface
/// types V1 .. Vk, as well as other typing relationships involving V0
/// ...
/// V0 is a proper subtype of each of V1 .. Vk
///
/// @description Check that an extension type is a subtype of its superinterface
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A06.dart and
/// test_cases/arguments_binding_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

import '../../utils/common.dart';

extension type V0(int i) implements int {}

V0 t0Instance = V0(42);

const t1Default = 1;

namedArgumentsFunc1(int t1, {int t2 = t1Default}) {}
positionalArgumentsFunc1(int t1, [int t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(int t1) {}

  ArgumentsBindingClass.named(int t1, {int t2 = t1Default}) {}
  ArgumentsBindingClass.positional(int t1, [int t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(int t1, {int t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(int t1, [int t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(int t1, {int t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(int t1, [int t2 = t1Default]) {}

  namedArgumentsMethod(int t1, {int t2 = t1Default}) {}
  positionalArgumentsMethod(int t1, [int t2 = t1Default]) {}

  set testSetter(int val) {}
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
  namedArgumentsFunc2<int>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<int> instance2 =
      new ArgumentsBindingGen<int>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<int>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<int>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
