// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch is an statement type with a sealed class as a
/// representation type and the set of cases is an exhaustive set of object
/// patterns with extension types
/// @author sgrekhov22@gmail.com
/// @issue 54444

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";
import "../Patterns/Exhaustiveness/exhaustiveness_lib.dart";

extension type FaceET1<T>(Face<T> _) {}
extension type FaceET2<T>(Face<T> _) implements Face<T> {}

extension type JackET<T>(Jack<T> _) implements Jack<T> {}
extension type QueenET<T>(Queen<T> _) implements Queen<T> {}
extension type KingET<T>(King<T> _) implements King<T> {}

String test1_1(FaceET1 face) {
  switch (face) {
    case JackET() || QueenET():
      return 'Jack or Queen';
    case KingET(suit: _):
      return 'King';
  }
}

String test1_2(FaceET2 face) {
  switch (face) {
    case JackET() || QueenET():
      return 'Jack or Queen';
    case KingET(suit: _):
      return 'King';
  }
}

String test2_1(FaceET1<int> face) {
  switch (face) {
    case JackET<num>() || QueenET<int>():
      return 'Jack or Queen';
    case KingET<int>(
        suit: Suit.club || Suit.diamond || Suit.heart || Suit.spade
      ):
      return 'King';
  }
}

String test2_2(FaceET2<int> face) {
  switch (face) {
    case JackET<num>() || QueenET<int>():
      return 'Jack or Queen';
    case KingET<int>(
        suit: Suit.club || Suit.diamond || Suit.heart || Suit.spade
      ):
      return 'King';
  }
}

String test3_1<T extends num>(FaceET1<T> face) {
  switch (face) {
    case JackET<num>() && JackET<T>(oneEyed: _): return 'Jack';
    case QueenET<num>(): return 'Queen';
    case KingET<T>(): return 'King';
  }
}

String test3_2<T extends num>(FaceET2<T> face) {
  switch (face) {
    case JackET<num>() && JackET<T>(oneEyed: _): return 'Jack';
    case QueenET<num>(): return 'Queen';
    case KingET<T>(): return 'King';
  }
}

main() {
  Expect.equals("Jack or Queen", test1_1(FaceET1(Jack(Suit.club))));
  Expect.equals("Jack or Queen", test1_2(FaceET2(Jack(Suit.club))));
  Expect.equals("Jack or Queen", test2_1(FaceET1(Jack(Suit.club))));
  Expect.equals("Jack or Queen", test2_2(FaceET2(Jack(Suit.club))));
  Expect.equals("King", test3_1<int>(FaceET1(King(Suit.club))));
  Expect.equals("King", test3_2<int>(FaceET2(King(Suit.club))));
}
