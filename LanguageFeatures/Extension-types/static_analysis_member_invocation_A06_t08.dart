// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that an instance members don't preclude a static method
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String _log = "";

extension type V1(int _) {
  static String n() => "V1";
}

extension type ET1(V1 _) implements V1 {
  String n() => "ET1";
}

extension type ET2(V1 _) implements V1 {
  String get n => "ET2";
}

extension type ET3(V1 _) implements V1 {
  void set n(String v) {
    _log = "ET3.n=$v";
  }
}

main() {
  Expect.equals("V1", V1.n());
  Expect.equals("ET1", ET1(V1(1)).n());
  Expect.equals("ET2", ET2(V1(2)).n);
  ET3(V1(2)).n = "x";
  Expect.equals("ET3.n=x", _log);
}
