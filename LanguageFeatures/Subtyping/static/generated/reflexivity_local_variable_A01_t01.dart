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
 * of T0 can be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from reflexivity_A01.dart and 
 * local_variable_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class T {
  const T();
}

T t0Instance = new T();
T t1Instance = new T();

const t1Default = const T();




class LocalVariableTest {

  LocalVariableTest() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }

  T t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
