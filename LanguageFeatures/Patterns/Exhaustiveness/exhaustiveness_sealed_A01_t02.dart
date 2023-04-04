// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if matched type of a
/// switch expression is a sealed class and all cases are exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,class-modifiers

import "exhaustiveness_lib.dart";
import "../../../Utils/expect.dart";

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

main() {
  Expect.equals("King", test1(King(Suit.club)));
  Expect.equals("King", test2(King(Suit.club)));
  Expect.equals("King", test3<int>(King(Suit.club)));
}
