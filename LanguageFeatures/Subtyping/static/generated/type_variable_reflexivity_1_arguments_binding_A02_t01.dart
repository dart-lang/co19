// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

///# @T0 = S0
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from type_variable_reflexivity_1_A02.dart and 
/// arguments_binding_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9


class X0 {}
class S0 extends X0 {
}


X0 t0Instance = new S0();
X0 t1Instance = new X0();


// @dart = 2.9



namedArgumentsFunc1(X0 t1, {X0 t2}) {}
positionalArgumentsFunc1(X0 t1, [X0 t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(X0 t1) {}

  ArgumentsBindingClass.named(X0 t1, {X0 t2}) {}
  ArgumentsBindingClass.positional(X0 t1, [X0 t2]) {}

  factory ArgumentsBindingClass.fNamed(X0 t1, {X0 t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(X0 t1, [X0 t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(X0 t1, {X0 t2}) {}
  static positionalArgumentsStaticMethod(X0 t1, [X0 t2]) {}

  namedArgumentsMethod(X0 t1, {X0 t2}) {}
  positionalArgumentsMethod(X0 t1, [X0 t2]) {}

  set testSetter(X0 val) {}
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



test<T>(T t0Instance) {
  if (t0Instance is S0) {
  
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
  namedArgumentsFunc2<X0>(t0Instance, t2: t0Instance);
  positionalArgumentsFunc2<X0>(t0Instance, t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<X0> instance2 = new ArgumentsBindingGen<X0>(t0Instance);
  instance2 = new ArgumentsBindingGen<X0>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<X0>.fPositional(t0Instance, t0Instance);
  instance2 = new ArgumentsBindingGen<X0>.named(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<X0>.positional(t0Instance, t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.positionalArgumentsMethod(t0Instance, t0Instance);
  instance2.testSetter = t0Instance;
  
  }
}

main() {
  test<S0>(t0Instance);
}
