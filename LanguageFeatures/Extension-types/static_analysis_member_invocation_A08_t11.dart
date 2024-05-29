// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has a non-extension
/// type member named n in the case where DV does not declare a member named n,
/// and one of the following criteria is satisfied:
/// - DV has a direct extension type superinterface V that has a non-extension
///   type member with signature m and name n, and DV does not declare a member
///   that precludes m.
/// - DV has a direct non-extension type superinterface whose interface contains
///   a member signature m named n, and DV does not declare a member that
///   precludes m.
///
/// @description Checks that a static members doesn't preclude each others
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String _log = "";

class C1 {
  static String get n => "C1";
}

class C2 {
  static void set n(String n) {
    _log = "C2.n=$n";
  }
}

class C3 {
  static String n() => "C3";
}

class D implements C1, C2, C3 {}

extension type ET1(D _) implements C1, C2, C3 {
  static void set n(String v) {
    _log = "ET1.n=$v";
  }
}

extension type ET2(D _) implements C1, C2, C3 {
  static String get n => "ET2";
}

extension type ET3(D _) implements C1, C2, C3 {
  static String n() => "ET3";
}

main() {
  Expect.equals("C1", C1.n);
  C2.n = "a";
  Expect.equals("C2.n=a", _log);
  Expect.equals("C3", C3.n());

  ET1.n = "b";
  Expect.equals("ET1.n=b", _log);
  Expect.equals("ET2", ET2.n);
  Expect.equals("ET3", ET3.n());
}
