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
/// @description Checks that if an extension type declares a method or setter
/// and they preclude inherited members then the attempt to call of those
/// precluded members is a compile-time error
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int _) {
  String n() => "V1";
}

extension type V2(int _) {
  void set n(String v) {}
}

extension type ET1(V1 _) implements V1 {
  void set n(String v) {}
}

extension type ET2(V2 _) implements V2 {
  String n() => "ET2";
}

extension type ET3(V1 _) implements V1 {
  void set n(int v) {}
}

extension type ET4(V2 _) implements V2 {
  int n() => 42;
}

main() {
  ET1(V1(0)).n();
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  ET2(V2(0)).n = "42";
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  ET3(V1(0)).n();
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  ET4(V2(0)).n = "42";
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}
