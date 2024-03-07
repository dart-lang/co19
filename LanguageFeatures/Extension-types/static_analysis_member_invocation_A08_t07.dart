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
/// @description Checks that an extension type declares a method it precludes
/// inherited members
/// @author sgrekhov22@gmail.com

class C1 {
  String n() => "C1";
}

class C2 {
  void set n(String v) {}
}

extension type ET1(C1 _) implements C1 {
  void set n(String v) {}
}

extension type ET2(C2 _) implements C2 {
  String n() => "ET2";
}

extension type ET3(C1 _) implements C1 {
  void set n(int v) {}
}

extension type ET4(C2 _) implements C2 {
  int n() => 42;
}

main() {
  ET1(C()).n();
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  ET2(C2()).n = "42";
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  ET3(C1()).n();
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  ET4(C2()).n = "42";
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
