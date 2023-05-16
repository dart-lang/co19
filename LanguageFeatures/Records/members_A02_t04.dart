// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks that a getter is exposed only for a named field.
/// @author sgrekhov22@gmail.com

typedef R = (int a, String, {int x, int y});

main() {
  R r1 = (1, "", x: 3, y: 4);
  r1.a;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  r1.any;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (3, 1, 4, name: "pi").any;
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
