// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The type of a final field which overrides/implements both a
/// setter and a getter is inferred to be the return type of the combined member
/// signature of said getter in the direct superinterfaces.
///
/// @description Check that the type of a late final field which which
/// implements both a setter and a getter is inferred to be the parameter type
/// of the combined member signature of said getter in the direct
/// superinterfaces.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {
  void set m1(String _) {}
  int get m1 => 42;
  void set m2(String _) {}
  num get m2 => 3.14;
}

class B {
  void set m1(String _) {}
  num get m1 => 3.14;
  void set m2(String _) {}
  int get m2 => 42;
}

class C implements A, B {
  late final m1 = 0;
  late final m2 = 0;
  set m1(_) {} // We need to implement setters as well
  set m2(_) {}
}

mixin M1 on A, B {
  late final m1 = 0;
  late final m2 = 0;
  set m1(_) {}
  set m2(_) {}
  test() {
    m1.expectStaticType<Exactly<int>>();
    m2.expectStaticType<Exactly<int>>();
  }
}

mixin M2 implements A, B {
  late final m1 = 0;
  late final m2 = 0;
  set m1(_) {}
  set m2(_) {}
}

mixin class MC implements A, B {
  late final m1 = 0;
  late final m2 = 0;
  set m1(_) {}
  set m2(_) {}
}

class MA = Object with M2;

main() {
  C().m1.expectStaticType<Exactly<int>>();
  C().m2.expectStaticType<Exactly<int>>();
  MC().m1.expectStaticType<Exactly<int>>();
  MC().m2.expectStaticType<Exactly<int>>();
  MA().m1.expectStaticType<Exactly<int>>();
  MA().m2.expectStaticType<Exactly<int>>();
  print(M1);
}
