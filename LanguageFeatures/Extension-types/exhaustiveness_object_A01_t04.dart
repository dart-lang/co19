// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch statement is a sealed class as and the set of cases is an
/// exhaustive set of object patterns with extension types
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../Patterns/Exhaustiveness/exhaustiveness_lib.dart";

extension type JackET<T>(Jack<T> _) implements Jack<T> {}
extension type QueenET<T>(Queen<T> _) implements Queen<T> {}
extension type KingET<T>(King<T> _) implements King<T> {}

String test1(Face face) {
  switch (face) {
    case JackET() || QueenET():
      return 'Jack or Queen';
    case KingET(suit: _):
      return 'King';
  }
}

String test2(Face<int> face) {
  switch (face) {
    case JackET<num>() || QueenET<int>():
      return 'Jack or Queen';
    case KingET<int>(
        suit: Suit.club || Suit.diamond || Suit.heart || Suit.spade
      ):
      return 'King';
  }
}

String test3<T extends num>(Face<T> face) {
  switch (face) {
    case JackET<num>() && JackET<T>(oneEyed: _): return 'Jack';
    case QueenET<num>(): return 'Queen';
    case KingET<T>(): return 'King';
  }
}

main() {
  Expect.equals("Jack or Queen", test1(Jack(Suit.club)));
  Expect.equals("Jack or Queen", test2(Jack(Suit.club)));
  Expect.equals("King", test3<int>(King(Suit.club)));
}
