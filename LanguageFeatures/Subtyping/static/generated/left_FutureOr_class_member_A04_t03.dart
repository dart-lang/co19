// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left FutureOr: T0 is FutureOr<S0>
///   and Future<S0> <: T1
///   and S0 <: T1
/// @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
/// are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
/// when an instance of T0 is an instance of Future<S0> type and S0 is a generic
/// type
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the mixin member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_FutureOr_A04.dart and 
/// test_cases/class_member_x03.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import "dart:async";

class A {}
class B extends A {}
class C<X> {
  const C();
}
class S0<X> extends C<X> {}

FutureOr<S0<B>> t0Instance = new Future<S0<B>>.value(new S0<B>());

const t1Default = const C<A>();

class ClassMemberMixin1_t03 {
  FutureOr<C<A>> m = t1Default;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = t0Instance;
    superSetter = t0Instance;
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = t0Instance;
  c1.test();
  c1.superSetter = t0Instance;
}
