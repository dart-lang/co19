// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Function Type/Function: T0 is a function type and T1 is Function
/// @description Check that if type T0 is a function type and T1 is Function then
/// T0 is a subtype of T1. Test void generic function with required arguments
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from function_type_function_A13.dart and 
/// arguments_binding_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9



class C {}

typedef void T0<X>(C c);
void t0Func<X>(C c) {}

T0<C> t0Instance = t0Func;
Function t1Instance = null;


// @dart = 2.9



namedArgumentsFunc1(Function t1, {Function t2}) {}
positionalArgumentsFunc1(Function t1, [Function t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(Function t1) {}

  ArgumentsBindingClass.named(Function t1, {Function t2}) {}
  ArgumentsBindingClass.positional(Function t1, [Function t2]) {}

  factory ArgumentsBindingClass.fNamed(Function t1, {Function t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(Function t1, [Function t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(Function t1, {Function t2}) {}
  static positionalArgumentsStaticMethod(Function t1, [Function t2]) {}

  namedArgumentsMethod(Function t1, {Function t2}) {}
  positionalArgumentsMethod(Function t1, [Function t2]) {}

  set testSetter(Function val) {}
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
  namedArgumentsFunc2<Function>(t0Instance, t2: t0Instance);
  positionalArgumentsFunc2<Function>(t0Instance, t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<Function> instance2 = new ArgumentsBindingGen<Function>(t0Instance);
  instance2 = new ArgumentsBindingGen<Function>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<Function>.fPositional(t0Instance, t0Instance);
  instance2 = new ArgumentsBindingGen<Function>.named(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<Function>.positional(t0Instance, t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.positionalArgumentsMethod(t0Instance, t0Instance);
  instance2.testSetter = t0Instance;
  }
