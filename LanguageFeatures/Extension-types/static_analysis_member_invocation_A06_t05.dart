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
/// @description Checks that an extension type declares an instance method or
/// setter then they may preclude inherited members
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String log = "";

extension type V1(int _) {
  String n() => "V1";
}

extension type V2(int _) {
  void set n(String v) {
    log = "V2: $v";
  }
}

extension type ET1(V1 _) implements V1 {
  void set n(String v) {
    log = "ET1: $v";
  }
}

extension type ET2(V2 _) implements V2 {
  String n() => "ET2";
}

extension type ET3(V1 _) implements V1 {
  void set n(int v) {
    log = "ET3: $v";
  }
}

extension type ET4(V2 _) implements V2 {
  T n<T>(T t) => t;
}

main() {
  ET1(V1(0)).n = "1";
  Expect.equals("ET1: 1", log);

  Expect.equals("ET2", ET2(V2(0)).n());
  ET3(V1(0)).n = 3;
  Expect.equals("ET3: 3", log);
  Expect.equals(42, ET4(V2(0)).n<int>(42));
}
