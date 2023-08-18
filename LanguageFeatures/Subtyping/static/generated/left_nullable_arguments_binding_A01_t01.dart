// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Nullable: if T0 is S0? then:
/// - T0 <: T1 iff S0 <: T1 and Null <: T1
/// @description Check that if type T0 is S0? and S0 <: T1 and Null <: T1 then
/// T0 is subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_nullable_A01.dart and
/// test_cases/arguments_binding_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

class T1 {
  const T1();
}
class S0 extends T1 {
  const S0();
}

S0? t0Instance = new S0();

const t1Default = const T1();

namedArgumentsFunc1(T1? t1, {T1? t2 = t1Default}) {}
positionalArgumentsFunc1(T1? t1, [T1? t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(T1? t1) {}

  ArgumentsBindingClass.named(T1? t1, {T1? t2 = t1Default}) {}
  ArgumentsBindingClass.positional(T1? t1, [T1? t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(T1? t1, {T1? t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(T1? t1, [T1? t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(T1? t1, {T1? t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(T1? t1, [T1? t2 = t1Default]) {}

  namedArgumentsMethod(T1? t1, {T1? t2 = t1Default}) {}
  positionalArgumentsMethod(T1? t1, [T1? t2 = t1Default]) {}

  set testSetter(T1? val) {}
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
  namedArgumentsFunc2<T1?>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<T1?> instance2 = new ArgumentsBindingGen<T1?>(t0Instance);
  instance2 = new ArgumentsBindingGen<T1?>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<T1?>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
}
