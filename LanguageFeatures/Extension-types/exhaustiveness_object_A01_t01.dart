// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression is an extension type with a sealed class as a
/// representation type and the set of cases is an exhaustive set of object
/// patterns
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../Patterns/Exhaustiveness/exhaustiveness_lib.dart";

extension type FaceET1<T>(Face<T> _) {}
extension type FaceET2<T>(Face<T> _) implements Face<T> {}

String test1_1(FaceET1 face) => switch (face) {
      Jack() => 'Jack',
      Queen() => 'Queen',
      King(suit: _) => 'King'
    };

String test1_2(FaceET2 face) => switch (face) {
      Jack() => 'Jack',
      Queen() => 'Queen',
      King(suit: _) => 'King'
    };

String test2_1(FaceET1<int> face) => switch (face) {
      Jack<num>() => 'Jack',
      Queen<int>() => 'Queen',
      King<int>(suit: Suit.club || Suit.diamond || Suit.heart || Suit.spade) =>
        'King'
    };

String test2_2(FaceET2<int> face) => switch (face) {
      Jack<num>() => 'Jack',
      Queen<int>() => 'Queen',
      King<int>(suit: Suit.club || Suit.diamond || Suit.heart || Suit.spade) =>
        'King'
    };

String test3_1<T extends num>(FaceET1<T> face) => switch (face) {
      Jack<num>() && Jack<T>(oneEyed: _) => 'Jack',
      Queen<num>() => 'Queen',
      King<T>() => 'King'
    };

String test3_2<T extends num>(FaceET2<T> face) => switch (face) {
      Jack<num>() && Jack<T>(oneEyed: _) => 'Jack',
      Queen<num>() => 'Queen',
      King<T>() => 'King'
    };

main() {
  Expect.equals("King", test1_1(FaceET1(King(Suit.club))));
  Expect.equals("King", test1_2(FaceET2(King(Suit.club))));
  Expect.equals("King", test2_1(FaceET1(King(Suit.club))));
  Expect.equals("King", test2_2(FaceET2(King(Suit.club))));
  Expect.equals("King", test3_1<int>(FaceET1(King(Suit.club))));
  Expect.equals("King", test3_2<int>(FaceET2(King(Suit.club))));
}
