// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression or statement is a sealed class and the set of
/// cases is exhaustive
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";
import "exhaustiveness_lib.dart";

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

String test4(Face face) {
  switch (face) {
    case Jack _ || Queen _: return 'Jack or Queen';
    case King(suit: _): return 'King';
  }
}

String test5(Face<int> face) {
  switch (face) {
    case Jack<num> _ || Queen<int> _: return 'Jack or Queen';
    case King<int>(suit: Suit.club || Suit.diamond || Suit.heart || Suit.spade):
      return 'King';
  }
}

String test6<T extends num>(Face<T> face) {
  switch (face) {
    case Jack<num>() && Jack<T>(oneEyed: _): return 'Jack';
    case Queen<num> _: return 'Queen';
    case King<T>(): return 'King';
  }
}

main() {
  Expect.equals("Jack or Queen", test1(Jack(Suit.club)));
  Expect.equals("Jack or Queen", test2(Jack(Suit.club)));
  Expect.equals("King", test3<int>(King(Suit.club)));
  Expect.equals("Jack or Queen", test4(Jack(Suit.club)));
  Expect.equals("Jack or Queen", test5(Jack(Suit.club)));
  Expect.equals("King", test6<int>(King(Suit.club)));
}
