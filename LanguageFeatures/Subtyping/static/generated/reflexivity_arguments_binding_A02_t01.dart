/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both dynamic then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from reflexivity_A02.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



dynamic t0Instance = 3.14;
dynamic t1Instance = "";




namedArgumentsFunc1(dynamic t1, {dynamic t2}) {}
positionalArgumentsFunc1(dynamic t1, [dynamic t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(dynamic t1) {}

  ArgumentsBindingClass.named(dynamic t1, {dynamic t2}) {}
  ArgumentsBindingClass.positional(dynamic t1, [dynamic t2]) {}

  factory ArgumentsBindingClass.fNamed(dynamic t1, {dynamic t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(dynamic t1, [dynamic t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(dynamic t1, {dynamic t2}) {}
  static positionalArgumentsStaticMethod(dynamic t1, [dynamic t2]) {}

  namedArgumentsMethod(dynamic t1, {dynamic t2}) {}
  positionalArgumentsMethod(dynamic t1, [dynamic t2]) {}

  set testSetter(dynamic val) {}
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
  namedArgumentsFunc2<dynamic>(t0Instance, t2: t0Instance);
  positionalArgumentsFunc2<dynamic>(t0Instance, t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<dynamic> instance2 = new ArgumentsBindingGen<dynamic>(t0Instance);
  instance2 = new ArgumentsBindingGen<dynamic>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<dynamic>.fPositional(t0Instance, t0Instance);
  instance2 = new ArgumentsBindingGen<dynamic>.named(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<dynamic>.positional(t0Instance, t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.positionalArgumentsMethod(t0Instance, t0Instance);
  instance2.testSetter = t0Instance;
  }
