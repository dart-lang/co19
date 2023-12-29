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

String test1(Face face) =>
    switch (face) { Jack _ => 'Jack', Queen _ => 'Queen', King _ => 'King' };

String test2(Face<int> face) => switch (face) {
      Jack<num> _ => 'Jack',
      Queen<int> _ => 'Queen',
      King<int> _ => 'King'
    };

String test3<T extends num>(Face<T> face) => switch (face) {
      Jack<num> _ => 'Jack',
      Queen<num> _ => 'Queen',
      King<T> _ => 'King'
    };

String test4(Face face) {
  switch (face) {
    case Jack _: return 'Jack';
    case Queen _: return 'Queen';
    case King _: return 'King';
  }
}

String test5(Face<int> face) {
  switch (face) {
    case Jack<num> _: return 'Jack';
    case Queen<int> _: return 'Queen';
    case King<int> _: return 'King';
  }
}

String test6<T extends num>(Face<T> face) {
  switch (face) {
    case Jack<num> _: return 'Jack';
    case  Queen<num> _: return 'Queen';
    case King<T> _: return 'King';
  }
}

main() {
  Expect.equals("King", test1(King(Suit.club)));
  Expect.equals("King", test2(King(Suit.club)));
  Expect.equals("King", test3<int>(King(Suit.club)));
  Expect.equals("King", test4(King(Suit.club)));
  Expect.equals("King", test5(King(Suit.club)));
  Expect.equals("King", test6<int>(King(Suit.club)));
}
