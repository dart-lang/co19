// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that if an extension type doesn't implement a subtype of
/// `Object` then is potentially non-nullable (it's a compile-time error to
/// assign `Object?` or `null` to it)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int? it) {}

extension type V2<T>(T id) {}

extension type V3(int it) {}

extension type V4<T extends Object>(T id) {}

main() {
  V1 v1_1 = V1(42) as Object?;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  V1 v1_2 = null;
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String?> v2_1 = V2("42") as Object?;
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String?> v2_2 = null;
//                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V3 v3_1 = V3(42) as Object?;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  V3 v3_2 = null;
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V4<String> v4_1 = V2("42") as Object?;
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified

  V4<String> v4_2 = null;
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
