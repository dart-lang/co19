// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Compile-time errors associated with constructors occur
/// accordingly.
///
/// @description Checks that it is a compile-time error if an extension type
/// constructor has no default value for an optional non-nullable parameter.
/// @author sgrekhov22@gmail.com
/// @issue 56402

extension type ET(int id) {
  ET.c1({this.id});
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.c2([this.id]);
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.c3([int x]): this.id = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  ET.c4({int x}): this.id = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET);
}
