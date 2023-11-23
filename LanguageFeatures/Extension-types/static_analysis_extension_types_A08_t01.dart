// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if await e occurs, and the static type
/// of e is an extension type which is not a subtype of Future<T> for any T.
///
/// @description Checks that it is a compile-time error if `await e` occurs, and
/// the static type of `e` is an extension type which is not a subtype of
/// `Future<T>` for any `T`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int id) {}

extension type V2<T>(T id) {}

extension type V3<T extends num>(T id) {}

main() async {
  V1 v1 = V1(42);
  await v1;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String> v2_1 = V2("42");
  await v2_1;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2 v2_2 = V2("42");
  await v2_2;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V3<int> v3_1 = V3(42);
  await v3_1;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V3 v3_2 = V3(42);
  await v3_2;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
