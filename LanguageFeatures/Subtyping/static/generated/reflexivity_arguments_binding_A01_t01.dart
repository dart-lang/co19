/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 is the same type as T0 then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from reflexivity_A01.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class T {}

T t0Instance = new T();
T t1Instance = new T();




namedArgumentsFunc1(T t1, {T t2}) {}
positionalArgumentsFunc1(T t1, [T t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(T t1) {}

  ArgumentsBindingClass.named(T t1, {T t2}) {}
  ArgumentsBindingClass.positional(T t1, [T t2]) {}

  factory ArgumentsBindingClass.fNamed(T t1, {T t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(T t1, [T t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(T t1, {T t2}) {}
  static positionalArgumentsStaticMethod(T t1, [T t2]) {}

  namedArgumentsMethod(T t1, {T t2}) {}
  positionalArgumentsMethod(T t1, [T t2]) {}

  set testSetter(T val) {}
}

class ArgumentsBindingGen<X>  {
  ArgumentsBindingGen(X t1) {}

  ArgumentsBindingGen.named(X t1, {X t2}) {}
  ArgumentsBindingGen.positional(X t1, [X t2]) {}

  factory ArgumentsBindingGen.fNamed(X t1, {X t2}) {
    return new ArgumentsBindingGen.named(t1, t2: t2);
  }
  factory ArgumentsBindingGen.fPositional(X t1, [X t2]) {
    return new ArgumentsBindingGen.positional(t1, t2);
  }

  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}

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
  namedArgumentsFunc2<T>(t0Instance, t2: t0Instance);
  positionalArgumentsFunc2<T>(t0Instance, t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<T> instance2 = new ArgumentsBindingGen<T>(t0Instance);
  instance2 = new ArgumentsBindingGen<T>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<T>.fPositional(t0Instance, t0Instance);
  instance2 = new ArgumentsBindingGen<T>.named(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<T>.positional(t0Instance, t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.positionalArgumentsMethod(t0Instance, t0Instance);
  instance2.testSetter = t0Instance;
  }
