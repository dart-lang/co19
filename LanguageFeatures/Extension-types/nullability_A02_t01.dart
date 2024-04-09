// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that a warning is produced if an extension type is a
/// subtype of `Object` and is checked by one of null-check operators
/// @author sgrekhov22@gmail.com
/// @issue 53822

extension type ET1<T>(T id) {
  void test() {
    this ?? print("No warning here!");
    this?.id; // No warning here!
  }
}

extension type ET2<T extends Object>(T id) {
  void test() {
    this ?? print("No warning here!");
    this?.id; // No warning here!
  }
}

extension type ET3<T extends Object>(T id) implements Object {
  void test() {
    this ?? print("Expect a warning here!");
//       ^^
// [analyzer] unspecified
    this?.id;
//      ^^
// [analyzer] unspecified
  }
}

main() {
  ET1(42).test();
  ET1(null).test();
  ET1<int?>(42).test();
  ET2(42).test();
  ET3(42).test();
}
