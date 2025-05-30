// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has an extension
/// type member named n in the cases where:
/// - DV declares a member named n.
/// - DV has no such declaration, but DV has a direct extension type
///   superinterface V that has an extension type instance member named n due to
///   a member declaration DM2, and DV does not declare an instance member that
///   precludes DM2.
///
/// @description Checks that an instance getter doesn't preclude an instance
/// setter and vice versa.
/// @author sgrekhov22@gmail.com
/// @issue 58579

import '../../Utils/expect.dart';

extension type V1(int _) {
  String get n => "V1";
}

extension type V2(int _) {
  void set n(String n) {}
}

extension type V0(int _) implements V1, V2 {}

extension type ET1(V1 _) implements V1 {
  void set n(int v) {}
}

extension type ET2(V2 _) implements V2 {
  int get n => 2;
}

extension type ET3(V0 _) implements V1, V2 {
  int get n => 3;
}

extension type ET4(V0 _) implements V1, V2 {
  void set n(int v) {}
}

main() {
  ET1 et1 = ET1(V1(1));
  et1.n = 42;
  Expect.equals("V1", et1.n);

  ET2 et2 = ET2(V2(2));
  et2.n = "42";
  Expect.equals(2, et2.n);

  ET3 et3 = ET3(V0(3));
  et3.n = "42";
  Expect.equals(3, et3.n);

  ET4 et4 = ET4(V0(4));
  et4.n = 42;
  Expect.equals("V1", et4.n);
}
