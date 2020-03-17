/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Object: if T1 is Object then:
 *  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
 *      B <: Object
 *  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
 *  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
 *  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
 *  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
 *      hold (per above, the result of the subtyping query is false).
 *  - Otherwise T0 <: T1 is true.
 * @description Check that if T0 is an unpromoted type variable with bound B
 * and B <: Object then T0 is subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_object_A01.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class B {}
class T0 extends B {}

T0 t0Instance = new T0();
Object t1Instance = new Object();

const t1Default = const Object();





namedArgumentsFunc1(Object t1, {Object t2 = t1Default}) {}
positionalArgumentsFunc1(Object t1, [Object t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(Object t1) {}

  ArgumentsBindingClass.named(Object t1, {Object t2 = t1Default}) {}
  ArgumentsBindingClass.positional(Object t1, [Object t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed(Object t1, {Object t2 = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(Object t1, [Object t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(Object t1, {Object t2 = t1Default}) {}
  static positionalArgumentsStaticMethod(Object t1, [Object t2 = t1Default]) {}

  namedArgumentsMethod(Object t1, {Object t2 = t1Default}) {}
  positionalArgumentsMethod(Object t1, [Object t2 = t1Default]) {}

  set testSetter(Object val) {}
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



test<T extends B>(T t0Instance) {
    
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

  //# <-- NotGenericFunctionType
  // test generic functions
  namedArgumentsFunc2<Object>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<Object> instance2 = new ArgumentsBindingGen<Object>(t0Instance);
  instance2 = new ArgumentsBindingGen<Object>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<Object>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
  //# -->

}

main() {
  test<T0>(t0Instance);
}
