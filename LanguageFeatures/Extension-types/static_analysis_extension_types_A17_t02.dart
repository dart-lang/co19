// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that if an instantiated representation type is
/// non-nullable and the extension type implements `Object` then it is a proper
/// subtype of `Object` (`Object` cannot be assigned to it).
/// @author sgrekhov22@gmail.com

extension type V1(int id) implements Object {}

extension type V2<T extends num>(T id) implements Object {}

main() {
  V1 v1 = Object();
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2 v2_1 = Object();
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<int> v2_2 = Object();
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
