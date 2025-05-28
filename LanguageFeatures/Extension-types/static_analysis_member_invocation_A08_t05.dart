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
/// @description Checks that a getter doesn't preclude a setter and vice versa.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class C1 {
  String get n => "C1";
}

mixin class C2 {
  void set n(String v) {}
}

class C0 = C1 with C2;

extension type ET1(C1 _) implements C1 {
  void set n(int v) {}
}

extension type ET2(C2 _) implements C2 {
  int get n => 2;
}

extension type ET3(C0 _) implements C1, C2 {
  int get n => 3;
}

extension type ET4(C0 _) implements C1, C2 {
  void set n(int v) {}
}

main() {
  ET1 et1 = ET1(C1());
  et1.n = 1;
  Expect.equals("C1", et1.n);

  ET2 et2 = ET2(C2());
  et2.n = "2";
  Expect.equals(2, et2.n);

  ET3 et3 = ET3(C0());
  et3.n = "3";
  Expect.equals(3, et3.n);

  ET4 et4 = ET4(C0());
  et4.n = 4;
  Expect.equals("C1", et4.n);
}
