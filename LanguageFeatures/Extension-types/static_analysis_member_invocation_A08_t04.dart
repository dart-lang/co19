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
/// @description Checks that a getter doesn't preclude setter and vice versa
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String log = "";

class C1 {
  String get n => "C1";
}

mixin class C2 {
  void set n(String v) {
    log = "C2: $v";
  }
}

class C0 = C1 with C2;

extension type ET1(C1 _) implements C1 {
  void set n(String v) {
    log = "ET1: $v";
  }
}

extension type ET2(C2 _) implements C2 {
  String get n => "ET2";
}

extension type ET3(C0 _) implements C1, C2 {
  String get n => "ET3";
}

extension type ET4(C0 _) implements C1, C2 {
  void set n(String v) {
    log = "ET4: $v";
  }
}

main() {
  final c = C0();
  Expect.equals("C1", ET1(c).n);
  ET1(c).n = "a";
  Expect.equals("ET1: a", log);
  log = "";

  Expect.equals("ET2", ET2(c).n);
  ET2(c).n = "b";
  Expect.equals("C2: b", log);
  log = "";

  Expect.equals("ET3", ET3(c).n);
  ET3(c).n = "c";
  Expect.equals("C2: c", log);
  log = "";

  Expect.equals("C1", ET4(c).n);
  ET4(c).n = "d";
  Expect.equals("ET4: d", log);
}
