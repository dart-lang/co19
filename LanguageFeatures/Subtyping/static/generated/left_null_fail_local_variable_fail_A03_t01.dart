/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Null: if T0 is Null then:
 * - if T1 is a type variable (promoted or not) the query is false
 * - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
 * - If T1 is Null, S? or S* for some S, then the query is true.
 * - Otherwise, the query is false
 * @description Check that otherwise, the query is false. Test some class S
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1.
 * Assignment to local variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_null_fail_A03.dart and 
 * local_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable

Null t0Instance = null;
Object t1Instance = new Object();

const t1Default = const Object();




class LocalVariableTest {
  LocalVariableTest() {
    Object t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  test() {
    Object t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    Object t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  Object t1 = t0Instance;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar () {
    Object t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
