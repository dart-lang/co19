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
/// @description Check that the type of a non-final field which overrides both a
/// setter and a getter is inferred to be the parameter type of said setter in
/// the direct superinterface. Test late variables.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A {
  void set m1(num _) {}
  num get m1 => 0;
  void set m2(num _) {}
  num get m2 => 42;
}

class C1 extends A {
  late var m1 = 0;
  late var m2 = 0;
}

class C2 with A {
  late var m1 = 0;
  late var m2 = 0;
}

mixin M on A {
  late var m1 = 0;
  late var m2 = 0;
}

class MA = A with M;

main() {
  C1().m1.expectStaticType<Exactly<num>>();
  C1().m2.expectStaticType<Exactly<num>>();
  C2().m1.expectStaticType<Exactly<num>>();
  C2().m2.expectStaticType<Exactly<num>>();
  MA().m1.expectStaticType<Exactly<num>>();
  MA().m2.expectStaticType<Exactly<num>>();
}
