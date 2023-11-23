// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that if an extension type doesn't implement a subtype of
/// `Object` then is potentially non-nullable (it's a compile-time error to
/// assign `null` to it)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int? it) {}

extension type V2<T>(T id) {}

extension type V3(int it) {}

extension type V4<T extends Object>(T id) {}

main() {
  V1 v1 = null;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String?> v2 = null;
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V3 v3 = null;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V4<String> v4 = null;
//                ^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
