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
/// @description Checks that if an extension type `ET` has a superinterface with
/// a member `m` then this member is also present in `ET` but members of its
/// representation type are not
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET0(int id) {
  void m1() {}
  int get m2 => 42;
  void set m3(int val) {}
}

extension type ET1(int id) implements ET0 {}

extension type ET2(int id) implements num {}

main() {
  ET1 et1 = ET1(42);
  et1.m1();
  et1.m2;
  et1.m3 = 42;
  et1.ceil();
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
