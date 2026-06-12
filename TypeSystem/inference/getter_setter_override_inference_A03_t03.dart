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

class A {
  void set m1(String _) {}
  num get m1 => 3.14;
  void set m2(String _) {}
  int get m2 => 42;
}

class B {
  void set m1(String _) {}
  int get m1 => 42;
  void set m2(String _) {}
  num get m2 => 3.14;
}

class C implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {} // We need to implement setters as well
  void set m2(_) {}
}

mixin M on A, B {
  get m1 => 0;
  get m2 => 0;
  test() {
    m1.expectStaticType<Exactly<int>>();
    m2.expectStaticType<Exactly<int>>();
  }
}

mixin class MC implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

enum E implements A, B {
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
