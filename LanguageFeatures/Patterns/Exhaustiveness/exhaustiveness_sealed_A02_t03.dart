// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is a compile-time error if matched type of a
/// switch expression is a sealed class and cases are not exhaustive
/// @author sgrekhov22@gmail.com

import "exhaustiveness_lib.dart";

String test1(Face face) => switch (face) {
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LastPersonOnEarth _ => 'LastPersonOnEarth'
};

String test2(Face face) => switch (face) {
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LastPersonOnEarth _ => 'Jack',
  Queen _ => 'Queen',
  King _  => 'King'
};

main() {
  test1(King(Suit.club));
  test2(King(Suit.club));
}
