// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Legacy if T0 is S0* then:
/// - T0 <: T1 iff S0 <: T1.
/// @description Check that if type T0 is S0* and S0 <: T1 then T0 is subtype of
/// T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the superclass member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from left_legacy_A01.dart and 
/// class_member_x02.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";
class S0 {}

var t0Instance = getLegacyType<S0>(new S0());
Object t1Instance = new Object();

const t1Default = const Object();




class ClassMemberSuper1_t02 {
  Object m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(Object val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {

  ClassMember1_t02() : super(t0Instance) {}

  ClassMember1_t02.named() : super.named(t0Instance) {}

  ClassMember1_t02.short() : super.short(t0Instance);

  test() {
    m = t0Instance;
    superSetter = t0Instance;
  }
}

main() {
  ClassMember1_t02 c1 = new ClassMember1_t02();
  c1 = new ClassMember1_t02.short();
  c1 = new ClassMember1_t02.named();
  c1.m = t0Instance;
  c1.test();
  c1.superSetter = t0Instance;
}
