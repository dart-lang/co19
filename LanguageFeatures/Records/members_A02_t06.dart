// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type.
///
/// @description Checks that only a getters for named fields are exposed. There
/// are no setters with the same name
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R = (int a, String, {int x, int y});

main() {
  R r1 = (1, "", x: 3, y: 4);
  r1.x = 0;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  r1.y = 0;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  (name: "pi", value: 3.14).value = 42;
//                          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (name: "pi", value: 3.14).name = "e";
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
