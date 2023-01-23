// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right FutureOr: T1 is FutureOr<S1> and
///   either T0 <: Future<S1>
///   or T0 <: S1
///   or T0 is X0 and X0 has bound S0 and S0 <: T1
///   or T0 is X0 & S0 and S0 <: T1
/// @description Check that if a type T1 is Future<S1> and a type T0 is X0 and
/// X0 has bound S0 and S0 is not a subtype of Future<S1> or S1, then a type T0
/// is not a subtype of a type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the superclass member of type T1.
/// Assignment to variable of super class is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from right_FutureOr_fail_A02.dart and 
/// class_member_super_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9



import "dart:async";

class S1 {}
class S0 {}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new Future.value(new S1());


// @dart = 2.9


class ClassMemberSuper1_t02 {
  FutureOr<S1> m;

  ClassMemberSuper1_t02(X0 value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    
  }
  ClassMemberSuper1_t02.named(X0 value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  void set superSetter(FutureOr<S1> val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {
  ClassMember1_t02() : super(t0Instance) {}
  ClassMember1_t02.named() : super.named(t0Instance) {}
  ClassMember1_t02.valid() : super(null);
  test1() {
    m = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  test2() {
    superSetter = t0Instance;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new ClassMember1_t02.valid().m = t0Instance;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ClassMember1_t02.valid().superSetter = t0Instance;
//                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
