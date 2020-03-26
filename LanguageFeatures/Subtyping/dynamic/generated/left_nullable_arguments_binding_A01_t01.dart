/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Nullable: if T0 is S0? then:
 * - T0 <: T1 iff S0 <: T1 and Null <: T1
 * @description Check that if type T0 is S0? and S0 <: T1 and Null <: T1 then
 * T0 is subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_nullable_A01.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}
class S0 extends T1 {
  const S0();
}

S0? t0Instance = new S0();
T1? t1Instance = new T1();

const t1Default = const T1();



namedArgumentsFunc1(T1? t1, {T1? t2 = t1Default}) {}
positionalArgumentsFunc1(T1? t1, [T1? t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(T1? t1) {}

  ArgumentsBindingClass.named(T1? t1, {T1? t2 = t1Default}) {}
  ArgumentsBindingClass.positional(T1? t1, [T1? t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(T1? t1, {T1? t2  = t1Default}) {
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

  //# <-- NotGenericFunctionType
  // test generic functions
  namedArgumentsFunc2<T1?>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<T1?> instance2 =
      new ArgumentsBindingGen<T1?>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<T1?>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<T1?>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
  //# -->
}
