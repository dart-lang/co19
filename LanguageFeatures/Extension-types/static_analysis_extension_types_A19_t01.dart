// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let DV be an extension type declaration named V with
/// representation type R. Assuming that all types have been fully alias
/// expanded, we say that DV has a representation dependency on an extension
/// type declaration DV2 if R contains an identifier id (possibly qualified)
/// that resolves to DV2, or id resolves to an extension type declaration DV3
/// and DV3 has a representation dependency on DV2.
///
/// It is a compile-time error if an extension type declaration has a
/// representation dependency on itself.
///
/// @description Checks that it is a compile-time error if an extension type has
/// a representation dependency on itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(V2 v2) {
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type V2(V1 id) {
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(V1);
  print(V2);
}
