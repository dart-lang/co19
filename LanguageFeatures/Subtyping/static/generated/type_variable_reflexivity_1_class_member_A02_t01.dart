/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Type Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
 * variables X0 & S0 and T1 is X0
 * @description Check that if type T0 a promoted type variables X0 & S0 and T1
 * is X0 then T0 is a subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from type_variable_reflexivity_1_A02.dart and 
 * class_member_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class X0 {
  const X0();
}
class S0 extends X0 {
}


S0 t0Instance = new S0();
X0 t1Instance = new X0();

const t1Default = const X0();




class ClassMember1_t01 {
  static X0 s = t0Instance;
  X0 m = t0Instance;
  X0 _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(X0 value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMember1_t01.short(this.m, this._p);

  test() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  set setter(X0 val) {
    _p = val;
  }

  X0 get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(X0 val) {
    s = val;
  }

  static X0 get staticGetter => t0Instance;
}



test<T>(T t0Instance) {
  if (t0Instance is S0) {
  
  ClassMember1_t01 c1 = new ClassMember1_t01();
  c1 = new ClassMember1_t01.short(t0Instance,
      t0Instance);
  c1 = new ClassMember1_t01.named(t0Instance);
  c1.m = t0Instance;
  c1.test();
  c1.setter = t0Instance;
  c1.getter;

  ClassMember1_t01.s = t0Instance;
  ClassMember1_t01.staticTest();
  ClassMember1_t01.staticSetter = t0Instance;
  ClassMember1_t01.staticGetter;

  }
}

main() {
  test<S0>(t0Instance);
}
