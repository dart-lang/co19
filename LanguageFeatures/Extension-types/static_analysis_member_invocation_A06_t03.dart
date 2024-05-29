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
/// setter and vice versa
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String log = "";

extension type V1(int _) {
  String get n => "V1";
}

extension type V2(int _) {
  void set n(String n) {
    log = "V2: $n";
  }
}

extension type V0(int _) implements V1, V2 {}

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
  final v = V0(0);
  Expect.equals("V1", ET1(v).n);
  ET1(v).n = "a";
  Expect.equals("ET1: a", log);

  Expect.equals("ET2", ET2(v).n);
  ET2(v).n = "b";
  Expect.equals("V2: b", log);

  Expect.equals("ET3", ET3(v).n);
  ET3(v).n = "c";
  Expect.equals("V2: c", log);

  Expect.equals("V1", ET4(v).n);
  ET4(v).n = "d";
  Expect.equals("ET4: d", log);
}
