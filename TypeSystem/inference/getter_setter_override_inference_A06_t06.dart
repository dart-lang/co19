// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The type of a non-final field which overrides both a setter and a
/// getter is inferred to be the parameter type of the combined member signature
/// of said setter in the direct superinterfaces, if this type is the same as
/// the return type of the combined member signature of said getter in the
/// direct superinterfaces. If the types are not the same then inference fails
/// with an error.
///
/// @description Check that the type of a non-final field which overrides or
/// implements both an external setter and an external getter is inferred to be
/// the parameter type of said setter in the direct superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

abstract mixin class A {
  external void set m1(num _);
  external num get m1;
  external void set m2(num _);
  external num get m2;
}

class C1 extends A {
  var m1 = 0;
  var m2 = 0;
}

class C2 with A {
  var m1 = 0;
  var m2 = 0;
}

class C3 implements A {
  var m1 = 0;
  var m2 = 0;
}

mixin M1 on A {
  var m1 = 0;
  var m2 = 0;
}

mixin M2 implements A {
  var m1 = 0;
  var m2 = 0;
}

mixin class MC implements A {
  var m1 = 0;
  var m2 = 0;
}

class MA1 = A with M1;
class MA2 = Object with M2;

main() {
  C1().m1.expectStaticType<Exactly<num>>();
  C1().m2.expectStaticType<Exactly<num>>();
  C2().m1.expectStaticType<Exactly<num>>();
  C2().m2.expectStaticType<Exactly<num>>();
  C3().m1.expectStaticType<Exactly<num>>();
  C3().m2.expectStaticType<Exactly<num>>();
  MA1().m1.expectStaticType<Exactly<num>>();
  MA1().m2.expectStaticType<Exactly<num>>();
  MA2().m1.expectStaticType<Exactly<num>>();
  MA2().m2.expectStaticType<Exactly<num>>();
  MC().m1.expectStaticType<Exactly<num>>();
  MC().m2.expectStaticType<Exactly<num>>();
}
