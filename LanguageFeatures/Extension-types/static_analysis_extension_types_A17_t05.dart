// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that it is a compile-time error to have an instance
/// variable whose type is an extension type, and then relying on implicit
/// initialization to null.
/// @author sgrekhov22@gmail.com

extension type V1(int? it) {}

extension type V2<T>(T id) {}

extension type V3(int it) {}

extension type V4<T extends Object>(T id) {}

extension type V5(int it) implements Object {}

extension type V6<T extends Object>(T id) implements Object {}

test1<X extends V1?>() {
  X x;
  print(x); // Expect an error on the first use of non-initialized variable
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test2<X extends V2<String?>?>() {
  X x;
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test3<X extends V3?>() {
  X x;
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test4<X extends V4<String>?>() {
  X x;
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test5<X extends V5?>() {
  X x;
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test6<X extends V6<String>?>() {
  X x;
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  V1 v1;
  print(v1);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String?> v2;
  print(v2);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  V3 v3;
  print(v3);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  V4<String> v4;
  print(v4);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  V5 v5;
  print(v5);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  V6<String> v6;
  print(v6);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}
