// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// have type `Null`. Test switch statement
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../Patterns/Exhaustiveness/exhaustiveness_lib.dart";

extension type CardET1<T>(Card<T> _) {}
extension type CardET2<T>(Card<T> _) implements Card<T> {}
extension type FaceET1<T>(Face<T> _) {}
extension type FaceET2<T>(Face<T> _) implements Face<T> {}
extension type PipET1<T>(Pip<T> _) {}
extension type PipET2<T>(Pip<T> _) implements Pip<T> {}

String test1(CardET1? c) {
  switch (c) {
    case Pip? _?:
      return "Pip";
    case Face? _?:
      return "Face";
    case Null _:
      return "null";
  }
}

String test2(CardET2? c) {
  switch (c) {
    case Pip? _?:
      return "Pip";
    case Face? _?:
      return "Face";
    case Null _:
    return "null";
  }
}

String test3(CardET1? c) {
  switch (c) {
    case PipET1? _?:
      return "Pip";
    case FaceET1? _?:
      return "Face";
    case Null _:
    return "null";
  }
}

String test4(CardET2? c) {
  switch (c) {
    case PipET2? _?:
      return "Pip";
    case FaceET2? _?:
      return "Face";
    case Null _:
    return "null";
  }
}

String test5(CardET1? c) {
  switch (c) {
    case PipET2? _?:
      return "Pip";
    case FaceET2? _?:
      return "Face";
    case Null _:
    return "null";
  }
}

String test6(CardET2? c) {
  switch (c) {
    case PipET1? _?:
      return "Pip";
    case FaceET1? _?:
      return "Face";
    case Null _:
    return "null";
  }
}

String test7(Card? c) {
  switch (c) {
    case PipET1? _?:
      return "Pip";
    case FaceET1? _?:
      return "Face";
    case Null _:
    return "null";
  }
}

String test8(Card? c) {
  switch (c) {
    case PipET2? _?:
      return "Pip";
    case FaceET2? _?:
      return "Face";
    case Null _:
    return "null";
  }
}

main() {
  Expect.equals("Pip", test1(CardET1(Pip(2, Suit.club))));
  Expect.equals("null", test1(null));
  Expect.equals("Face", test2(CardET2(Jack(Suit.club))));
  Expect.equals("null", test2(null));
  Expect.equals("Pip", test3(CardET1(Pip(2, Suit.club))));
  Expect.equals("null", test3(null));
  Expect.equals("Face", test4(CardET2(Jack(Suit.club))));
  Expect.equals("null", test4(null));
  Expect.equals("Pip", test5(CardET1(Pip(2, Suit.club))));
  Expect.equals("null", test5(null));
  Expect.equals("Face", test6(CardET2(Jack(Suit.club))));
  Expect.equals("null", test6(null));
  Expect.equals("Pip", test7(Pip(2, Suit.club)));
  Expect.equals("null", test7(null));
  Expect.equals("Face", test8(Jack(Suit.club)));
  Expect.equals("null", test8(null));
}
