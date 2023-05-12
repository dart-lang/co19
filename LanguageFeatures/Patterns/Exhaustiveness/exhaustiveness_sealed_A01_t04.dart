// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if matched type of a
/// switch expression is a sealed class and all cases are exhaustive
/// @author sgrekhov22@gmail.com

import "exhaustiveness_lib.dart";
import "../../../Utils/expect.dart";

String test1(Face face) => switch (face) {
      Jack _ || Queen _ => 'Jack or Queen',
      King(suit: _) => 'King'
    };

String test2(Face<int> face) => switch (face) {
      Jack<num> _ || Queen<int> _ => 'Jack or Queen',
      King<int>(suit: Suit.club || Suit.diamond || Suit.heart || Suit.spade) =>
        'King'
    };

String test3<T extends num>(Face<T> face) => switch (face) {
      Jack<num>() && Jack<T>(oneEyed: _) => 'Jack',
      Queen<num> _ => 'Queen',
      King<T>() => 'King'
    };

main() {
  Expect.equals("Jack or Queen", test1(Jack(Suit.club)));
  Expect.equals("Jack or Queen", test2(Jack(Suit.club)));
  Expect.equals("King", test3<int>(King(Suit.club)));
}
