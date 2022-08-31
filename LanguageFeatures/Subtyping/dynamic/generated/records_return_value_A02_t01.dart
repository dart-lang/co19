// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
/// 
/// @description Check that if type T0 is a record with the same shape as T1
/// and the type of each field of T0 is a subtype of the corresponding field
/// types of T1 then T0 is a subtype of T1. Check positional and named fields
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_A02.dart and 
/// return_value_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';

// SharedOptions=--enable-experiment=records

(int x, double y, String, {int n1, String n2}) t0Instance =
  (n1: 1, n2: "n2", 42, 3.14, "");
(num, num z, String?, {num n1, String? n2}) t1Instance =
  (0, n1: 0, 0, n2: null, null);

const t1Default = (0, 0, null, {n1: 0.1, n2: ""});




(num, num, String?, {num n1, String? n2}) returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static (num, num, String?, {num n1, String? n2}) staticTestMethod() => forgetType(t0Instance);

  (num, num, String?, {num n1, String? n2}) testMethod() => forgetType(t0Instance);

  (num, num, String?, {num n1, String? n2}) get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  (num, num, String?, {num n1, String? n2}) returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  new ReturnValueGen<(num, num, String?, {num n1, String? n2})>().testMethod();
  new ReturnValueGen<(num, num, String?, {num n1, String? n2})>().testGetter;
  //# -->
}
