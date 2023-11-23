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
/// @description Checks that a getter doesn't preclude setter and vice versa
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int _) {
  String get n => "V1";
}

extension type V2(int _) {
  void set n(String n) {}
}

extension type V0(int _) implements V1, V2 {}

extension type ET1(V1 _) implements V1 {
  void set n(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(V2 _) implements V2 {
  int get n => 2;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(V0 _) implements V1, V2 {
  int get n => 3;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(V0 _) implements V1, V2 {
  void set n(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
