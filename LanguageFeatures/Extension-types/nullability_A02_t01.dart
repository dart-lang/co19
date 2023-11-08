// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let V be an extension type of the form Name<T1, .. Ts>, and let R
/// be the corresponding instantiated representation type. If R is non-nullable
/// then V is a proper subtype of Object, and V is non-nullable. Otherwise, V is
/// a proper subtype of Object?, and V is potentially nullable.
///
/// @description Checks that a warning is produced depending of the
/// representation type when an extension type is checked by `??` operator
/// @author sgrekhov22@gmail.com
/// @issue 53822

// SharedOptions=--enable-experiment=inline-class

extension type ET1<T>(T _) {
  void test() {
    this ?? print("No warning here!");
  }
}

extension type ET2<T extends Object>(T _) implements Object {
  void test() {
    this ?? print("Expect a warning here!");
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  ET1(42).test();
  ET1(null).test();
  ET1<int?>(42).test();
  ET2(42).test();
}
