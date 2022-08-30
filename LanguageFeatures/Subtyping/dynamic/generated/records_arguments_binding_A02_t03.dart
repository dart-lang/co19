// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
/// 
/// @description Check that if type T0 is a record with the same shape that T1
/// and the types of all fields of T0 is subtype of of the corresponding field
/// types of T1 then T0 is subtype of T1. Check positional and named fields
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test mixin members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_A02.dart and 
/// arguments_binding_x03.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';

// SharedOptions=--enable-experiment=records

(int x, double y, String, {int n1, String n2}) t0Instance =
  (n1: 1, n2: "n2", 42, 3.14, "");
(num, num z, String?, {num n1, String? n2}) t1Instance =
  (0, n1: 0, 0, n2: null, null);

const t1Default = (0, 0, null, {n1: 0.1, n2: ""});




class ArgumentsBindingMixin1_t03 {
  (num, num, String?, {num n1, String? n2}) m = t1Default;

  void superTest((num, num, String?, {num n1, String? n2}) val) {}
  void superTestPositioned((num, num, String?, {num n1, String? n2}) val, [(num, num, String?, {num n1, String? n2}) val2 = t1Default]) {}
  void superTestNamed((num, num, String?, {num n1, String? n2}) val, {(num, num, String?, {num n1, String? n2}) val2 = t1Default}) {}
  (num, num, String?, {num n1, String? n2}) get superGetter => m;
  void set superSetter((num, num, String?, {num n1, String? n2}) val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingMixin1_t03 {

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

class ArgumentsBindingMixin2_t03<X> {
  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t03<X> extends Object with ArgumentsBindingMixin2_t03<X> {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
  }
}

main() {
  ArgumentsBinding1_t03 c1 = new ArgumentsBinding1_t03();

  c1.test(forgetType(t0Instance), t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  ArgumentsBinding2_t03<(num, num, String?, {num n1, String? n2})> c2 = new ArgumentsBinding2_t03<(num, num, String?, {num n1, String? n2})>();
  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  //# -->
}
