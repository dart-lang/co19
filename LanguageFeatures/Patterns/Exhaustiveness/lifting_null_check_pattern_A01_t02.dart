// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Null-check pattern:
/// i. Let S be the expanded spaces of the lifted space union of the subpattern.
/// ii. Remove any unions in S that have type Null. A null-check pattern
///   specifically does not match null, so even if the subpattern would handle
///   it, it will never see it.
/// iii. The result is S.
///
/// @description Check that a null-check pattern removes any unions in `S` that
/// have type `Null`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "exhaustiveness_lib.dart";
import "../../../Utils/expect.dart";

String test1(Card? c) {
  switch (c) {
    case Pip? _?:
      return "Pip";
    case Face? _?:
      return "Face";
    case Null _:
      return "null";
  }
}

String test2(Card? c) => switch (c) {
      Pip? _? => "Pip",
      Face? _? => "Face",
      Null _ => "null"
    };

main() {
  Expect.equals("Pip", test1(Pip(2, Suit.club)));
  Expect.equals("null", test1(null));
  Expect.equals("Face", test2(Jack(Suit.club)));
  Expect.equals("null", test2(null));
}
