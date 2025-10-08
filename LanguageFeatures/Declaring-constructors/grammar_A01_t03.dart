// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class declaration whose class body is `;` is treated as a class
/// declaration whose class body is `{}`.
///
/// @description Check that an extension type declaration whose body is `;` is
/// treated as an extension type declaration whose class body is `{}`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

extension type ET1;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2();
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);

}
