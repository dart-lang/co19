// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter which overrides/implements both a
/// setter and a getter is inferred to be the return type of the combined member
/// signature of said getter in the direct superinterfaces.
///
/// @description Check that the return type of a getter which implements both a
/// setter and a getter is inferred to be the return type of the combined member
/// signature of said getter in the direct superinterfaces.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

abstract class A<X, Y> {
  void set m1(String _) {}
  X get m1;
  void set m2(String _) {}
  Y get m2;
}

abstract class B<X extends int, Y extends num> {
  void set m1(String _) {}
  X get m1;
  void set m2(String _) {}
  Y get m2;
}

class C implements A<num, int>, B {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {} // We need to implement setters as well
  void set m2(_) {}
}

mixin M on A<num, int>, B {
  get m1 => 0;
  get m2 => 0;
  test() {
    m1.expectStaticType<Exactly<int>>();
    m2.expectStaticType<Exactly<int>>();
  }
}

mixin class MC implements A<num, int>, B {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

enum E implements A<num, int>, B {
  e0;

  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

main() {
  C().m1.expectStaticType<Exactly<int>>();
  C().m2.expectStaticType<Exactly<int>>();
  MC().m1.expectStaticType<Exactly<int>>();
  MC().m2.expectStaticType<Exactly<int>>();
  E.e0.m1.expectStaticType<Exactly<int>>();
  E.e0.m2.expectStaticType<Exactly<int>>();
  print(M);
}
