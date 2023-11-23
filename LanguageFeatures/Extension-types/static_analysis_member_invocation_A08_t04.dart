// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that a getter doesn't preclude setter and vice versa
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

String log = "";

class V1 {
  String get n => "V1";
}

mixin class V2 {
  void set n(String v) {
    log = "V2: $v";
  }
}

class V0 = V1 with V2;

extension type ET1(V1 _) implements V1 {
  void set n(String v) {
    log = "ET1: $v";
  }
}

extension type ET2(V2 _) implements V2 {
  String get n => "ET2";
}

extension type ET3(V0 _) implements V1, V2 {
  String get n => "ET3";
}

extension type ET4(V0 _) implements V1, V2 {
  void set n(String v) {
    log = "ET4: $v";
  }
}

main() {
  final v = V0();
  Expect.equals("V1", ET1(v).n);
  ET1(v).n = "a";
  Expect.equals("ET1: a", log);
  log = "";

  Expect.equals("ET2", ET2(v).n);
  ET2(v).n = "b";
  Expect.equals("V2: b", log);
  log = "";

  Expect.equals("ET3", ET3(v).n);
  ET3(v).n = "c";
  Expect.equals("V2: c", log);
  log = "";

  Expect.equals("V1", ET4(v).n);
  ET4(v).n = "d";
  Expect.equals("ET4: d", log);
}
