// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type.
///
/// @description Checks that positional fields can be accessed using `.$i`,
/// where `i` is a zero-based index of the field. Test that value of `i` is
/// limited by the number of positional fields
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R = (int a, String, {int x, int y});

main() {
  R r1 = (1, "", x: 3, y: 4);
  r1.$2;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  r1.$42;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (3, 1, 4, name: "pi").$3;
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}
