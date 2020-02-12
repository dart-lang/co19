/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Promoted Variable: T0 is a promoted type variable X0 & S0
 * and S0 <: T1
 * @description Check that if type T0 is a promoted type variable X0 & S0 and S0
 * is subtype of T1 then T0 is a subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1. Test superclass members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_promoted_variable_A01.dart and 
 * arguments_binding_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}
class X0 {}
class S0 extends X0 implements T1 {}


S0 t0Instance = new S0();
T1 t1Instance = new T1();

const t1Default = const T1();




class ArgumentsBindingSuper1_t02 {
  T1 m;

  ArgumentsBindingSuper1_t02(T1 value): m = value {}
  ArgumentsBindingSuper1_t02.named(T1 value, {T1 val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(T1 value, [T1 val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(T1 val) {}
  void superTestPositioned(T1 val, [T1 val2 = t1Default]) {}
  void superTestNamed(T1 val, {T1 val2 = t1Default}) {}
  T1 get superGetter => m;
  void set superSetter(T1 val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value): m = value {}
  ArgumentsBindingSuper2_t02.named(X value, {required X val2}): m = value {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(X t1) : super(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test(X t1, X t2) {
    superTest(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}



main() {
  X0 t0Instance = new S0();

  if (t0Instance is S0) {
    
  ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(t0Instance);
  c1 = new ArgumentsBinding1_t02.c1(t0Instance);
  c1 = new ArgumentsBinding1_t02.c2(t1Instance, t0Instance);
  c1 = new ArgumentsBinding1_t02.c3(t0Instance);
  c1 = new ArgumentsBinding1_t02.c4(t1Instance, t0Instance);
  c1 = new ArgumentsBinding1_t02.c5(t0Instance);

  c1.test(t0Instance, t1Instance);
  c1.superTest(t0Instance);
  c1.superTestPositioned(t0Instance);
  c1.superTestPositioned(t1Instance, t0Instance);
  c1.superTestNamed(t0Instance);
  c1.superTestNamed(t1Instance, val2: t0Instance);
  c1.superSetter = t0Instance;
  c1.superGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  ArgumentsBinding2_t02<T1> c2 =
    new ArgumentsBinding2_t02<T1>(t0Instance);
  c2 = new ArgumentsBinding2_t02<T1>.c2(t1Instance, t0Instance);
  c2 = new ArgumentsBinding2_t02<T1>.c5(t0Instance);

  c2.test(t0Instance, t1Instance);
  c2.superTest(t0Instance);
  c2.superTestNamed(t1Instance, val2: t0Instance);
  c2.superSetter = t0Instance;
  c2.superGetter;
  //# -->

  }
}
