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
  Jack _ => 'Jack',
  Queen _ => 'Queen',
  King(suit: Suit.club) => 'King'
};

String test2(Face<num> face) => switch (face) {
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Jack<num> _ => 'Jack',
  Queen<int> _ => 'Queen',
  King<int>(suit: Suit.club)  => 'King'
};

String test3<T extends num>(Face<T> face) => switch (face) {
//                                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Jack<num>(oneEyed: false) && Jack<T>(oneEyed: true) => 'Jack',
  Queen<num> _ => 'Queen',
  King<T>(suit: _) => 'King'
};

main() {
  test1(King(Suit.club));
  test2(King(Suit.club));
  test3<int>(King(Suit.club));
}
