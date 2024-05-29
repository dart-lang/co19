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
/// @description Checks that an extension type declares a method or setter then
/// they preclude inherited members
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String log = "";

class C1 {
  String n() => "C1";
}

class C2 {
  void set n(String v) {
    log = "C2: $v";
  }
}

extension type ET1(C1 _) implements C1 {
  void set n(String v) {
    log = "ET1: $v";
  }
}

extension type ET2(C2 _) implements C2 {
  String n() => "ET2";
}

extension type ET3(C1 _) implements C1 {
  void set n(int v) {
    log = "ET3: $v";
  }
}

extension type ET4(C2 _) implements C2 {
  T n<T>(T t) => t;
}

main() {
  ET1(C1()).n = "1";
  Expect.equals("ET1: 1", log);
  log = "";
  Expect.equals("ET2", ET2(C2()).n());
  ET3(C1()).n = 3;
  Expect.equals("ET3: 3", log);
  Expect.equals(42, ET4(C2()).n<int>(42));
}
