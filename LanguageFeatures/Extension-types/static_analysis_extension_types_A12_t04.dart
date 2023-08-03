// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if DV is an extension type
/// declaration, and DV has a non-extension type member named m as well as an
/// extension type member named m, for any m.
///
/// @description Checks that it is not an error if an extension type declaration
/// has a non-extension type member named `m` as well as an extension type
/// member named `m` but declares its own member with the name `m`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

class A {
  int get m1 => 1;
  void m2() {}
  void set m3(int v) {}
}

extension type ET1(A a) {
  int get m1 => 2;
  void m2() {}
  void set m3(int v) {}
}

extension type ET2(A id) implements A, ET1 {
  int get m1 => 3;
  int m2() => 4;
  void set m3(String v) {}
}

main() {
  ET2 v = ET2(A());
  Expect.equals(3, v.m1);
  Expect.equals(4, v.m2());
  v.m3 = "42";
}
