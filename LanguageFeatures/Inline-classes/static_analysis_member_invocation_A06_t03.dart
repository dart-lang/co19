// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has a non-extension
/// type member named n in the case where DV does not declare a member named n,
/// but DV has a direct extension type superinterface V that has a non-extension
/// type member named n, or DV has a direct non-extension type superinterface T
/// whose interface contains a member signature named n.
///
/// @description Checks that if an extension type `ET` has a superinterface with
/// a member `m` then this member is also presents in `ET`v but members of its
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

class I {
  int i = 0;
}

class J extends I {
  int j = 1;
}

extension type ET3(J rep) implements I {
  int get jOfEt3 => rep.j;
}

main() {
  ET1 et1 = ET1(42);
  et1.m1();
  et1.m2;
  et1.m3 = 42;
  et1.ceil();
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET2 et2 = ET2(42);
  et2.ceil();
  et2.isOdd;
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var et3 = ET3(J());
  et3.rep;
  et3.i;
  et3.jOfEt3;
  et3.j;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
