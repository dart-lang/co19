// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has an extension
/// type member named n in the cases where:
/// - DV declares a member named n.
/// - DV has no such declaration, but DV has a direct extension type
///   superinterface V that has an extension type member named n due to a member
///   declaration DM2, and DV does not declare a member that precludes DM2.
///
/// @description Checks that it is no error if an extension type declares a
/// getter that precludes inherited members
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type V1(int id) {
  void n(int n) {}
}

extension type V2(int id) {
  String get n => "V2";
}

extension type V3(int id) {
  void set n(int n) {}
}

extension type ET1(int id) implements V1 {
  bool get n => true;
}

extension type ET2(int id) implements V2 {
  bool get n => true;
}

extension type ET3(int id) implements V3 {
  bool get n => true;
}

extension type ET4(int id) implements V1, V2, V3 {
  bool get n => true;
}

main() {
  Expect.isTrue(ET1(42).n);
  Expect.isTrue(ET2(42).n);
  Expect.isTrue(ET3(42).n);
  Expect.isTrue(ET4(42).n);
}
