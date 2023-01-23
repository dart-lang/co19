// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

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
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from left_FutureOr_A04.dart and 
/// local_variable_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9



import "dart:async";

class A {}
class B extends A {}
class C<X> {}
class S0<X> extends C<X> {}

FutureOr<S0<B>> t0Instance = new Future<S0<B>>.value(new S0<B>());
FutureOr<C<A>> t1Instance = new Future<C<A>>.value(new C<A>());


// @dart = 2.9



class LocalVariableTest {

  LocalVariableTest() {
    FutureOr<C<A>> t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    FutureOr<C<A>> t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    FutureOr<C<A>> t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    FutureOr<C<A>> t1 = t0Instance;
    t1 = t0Instance;
  }

  FutureOr<C<A>> t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
