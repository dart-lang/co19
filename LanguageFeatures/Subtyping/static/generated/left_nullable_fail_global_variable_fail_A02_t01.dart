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
 * @description Check that if type T0 is S0? and Null <: T1 but S0 is not
 * subtype T1 then T0 is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to global variable of type T1.
 * Assignment to global variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_nullable_fail_A02.dart and 
 * global_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}
class S0 {
  const S0();
}

S0? t0Instance = new S0();
T1? t1Instance = new T1();

const t1Default = const T1();




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  foo() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static test() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  t1Instance = t0Instance;
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar () {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
