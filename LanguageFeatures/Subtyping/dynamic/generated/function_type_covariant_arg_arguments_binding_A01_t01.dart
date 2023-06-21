// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that if type `T0` is a function type with a covariant
/// arguments and `T1` is a function type with arguments that are supertypes of
/// `T0` arguments, then `T0` is a subtype of `T1`.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_A01.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

class A {
  void foo(num n, [Object o = "A"]) => print("A");
}

class C implements A {
  void foo(covariant int n, [covariant String c = "C"]) => print("C");
}

A a = A();
A c = C();
void Function(num n, [Object o]) t0Instance = c.foo;

void baz(num n, [Object o = ""]) {}
const t1Default = baz;

namedArgumentsFunc1(void Function(num n, [Object o]) t1, {void Function(num n, [Object o]) t2 = t1Default}) {}
positionalArgumentsFunc1(void Function(num n, [Object o]) t1, [void Function(num n, [Object o]) t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(void Function(num n, [Object o]) t1) {}

  ArgumentsBindingClass.named(void Function(num n, [Object o]) t1, {void Function(num n, [Object o]) t2 = t1Default}) {}
  ArgumentsBindingClass.positional(void Function(num n, [Object o]) t1, [void Function(num n, [Object o]) t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(void Function(num n, [Object o]) t1, {void Function(num n, [Object o]) t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(void Function(num n, [Object o]) t1, [void Function(num n, [Object o]) t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(void Function(num n, [Object o]) t1, {void Function(num n, [Object o]) t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(void Function(num n, [Object o]) t1, [void Function(num n, [Object o]) t2 = t1Default]) {}

  namedArgumentsMethod(void Function(num n, [Object o]) t1, {void Function(num n, [Object o]) t2 = t1Default}) {}
  positionalArgumentsMethod(void Function(num n, [Object o]) t1, [void Function(num n, [Object o]) t2 = t1Default]) {}

  set testSetter(void Function(num n, [Object o]) val) {}
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
  namedArgumentsFunc2<void Function(num n, [Object o])>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<void Function(num n, [Object o])> instance2 =
      new ArgumentsBindingGen<void Function(num n, [Object o])>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<void Function(num n, [Object o])>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<void Function(num n, [Object o])>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
