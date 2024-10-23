// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the representation type of an
/// extension type declaration is a bottom type.
///
/// @description Check that it is a compile-time error if the representation
/// type of an extension type declaration is a bottom type.
/// @author sgrekhov22@gmail.com

typedef NeverAlias = Never;

extension type ET1(Never _) {}
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(NeverAlias _) {}
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
}
