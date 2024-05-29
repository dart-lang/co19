// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has a non-extension
/// type member named n in the case where DV does not declare a member named n,
/// and one of the following criteria is satisfied:
/// - DV has a direct extension type superinterface V that has a non-extension
///   type member with signature m and name n, and DV does not declare an
///   instance member that precludes m.
/// - DV has a direct non-extension type superinterface whose interface contains
///   a member signature m named n, and DV does not declare an instance member
///   that precludes m.
///
/// @description Checks that method inherited from superinterface can be
/// abstract
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

int log = 0;

abstract class A {
  int m1();
  int get m2;
  void set m3(int i);
}

abstract class B extends A {}

class C implements B {
  int m1() => 1;
  int get m2 => 2;
  void set m3(int i) {
    log = i;
  }
}

extension type ET(B id) implements A {}

main() {
  Expect.equals(1, ET(C()).m1());
  Expect.equals(2, ET(C()).m2);
  C().m3 = 3;
  Expect.equals(3, log);
}
