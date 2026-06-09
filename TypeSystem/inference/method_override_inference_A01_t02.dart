// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A method `m` of a class `C` is subject to override inference if
/// it is missing one or more component types of its signature, and one or more
/// of the direct superinterfaces of `C` has a member named `m` (that is, `C.m`
/// overrides one or more declarations). Each missing type is filled in with the
/// corresponding type from the combined member signature `s` of `m` in the
/// direct superinterfaces of `C`.
///
/// @description Checks that in case of extension missing components of a method
/// signature are not inferred form a superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {
  num m1() => 3.14;
  void m2(num v) {}
  void m3([num v = 0]) {}
  void m4({num v = 0}) {}
  void m5({required num v}) {}
}

extension Ext on A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

main() {
  A().m1.expectStaticType<Exactly<num Function()>>();
  A().m2.expectStaticType<Exactly<void Function(num)>>();
  A().m3.expectStaticType<Exactly<void Function([num])>>();
  A().m4.expectStaticType<Exactly<void Function({num v})>>();
  A().m5.expectStaticType<Exactly<void Function({required num v})>>();

  Ext(A()).m1.expectStaticType<Exactly<dynamic Function()>>();
  Ext(A()).m2.expectStaticType<Exactly<void Function(dynamic)>>();
  Ext(A()).m3.expectStaticType<Exactly<void Function([dynamic])>>();
  Ext(A()).m4.expectStaticType<Exactly<void Function({dynamic v})>>();
  Ext(A()).m5.expectStaticType<Exactly<void Function({required dynamic v})>>();
}
