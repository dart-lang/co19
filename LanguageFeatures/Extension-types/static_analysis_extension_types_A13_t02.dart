// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if DV is an extension type
/// declaration, and DV has a non-extension type member named m, and the
/// computation of a combined member signature for all non-extension type
/// members named m fails.
///
/// @description Checks that it is not an error if an extension type declaration
/// has a non-extension type member named `m`, and the computation of a combined
/// member signature for all non-extension type members named `m` fails, but the
/// extension type declares member `m`
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

class A {
  void m1(int i) {}
  void m2(int i) {}
}

class B {
  void m1(double d) {}
  void m2(double d) {}
}

class C implements A, B {
  void m1(num n) {}
  void m2(num n) {}
}

extension type ET(C c) implements A, B {
  int get m1 => 42;
  void m2(double d) {}
}

main() {
  Expect.equals(42, ET(C()).m1);
  ET(C()).m2.expectStaticType<Exactly<void Function(double)>>();
}
