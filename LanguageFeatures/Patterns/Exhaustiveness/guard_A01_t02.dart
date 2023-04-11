// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion To tell if the set of cases in a switch statement or expression
/// are exhaustive over the matched value type:
/// 1. Lift the matched value type to a space union value.
/// 2. Discard any cases that have guards. Since static analysis can't tell when
///   a guard might evaluate to false, any case with a guard doesn't reliably
///   match values and so can't help prove exhaustiveness.
/// 3. Lift the remaining case patterns to a set of space unions cases.
/// 4. The switch is exhaustive if is-exhaustive with value and cases is true
///   and false otherwise.
///
/// @description Check that exhaustiveness can be recognized based on the cases
/// without guards, even in the case where cases with guards exist as well.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,class-modifiers

import "exhaustiveness_lib.dart";
import "../../../Utils/expect.dart";

String testBool1(bool b) {
  switch (b) {
    case true:
      return "true";
    case false when b == false:
      return "false1";
    case false:
      return "false2";
  }
}

String testBool2(bool b) =>
  switch (b) {
    true when b == true => "true1",
    true => "true2",
    false =>  "false"
  };

String testEnum1(Suit suit) {
  switch (suit) {
    case Suit.club:
    case Suit.diamond:
    case Suit.heart when suit == Suit.heart:
    case Suit.heart:
    case Suit.spade:
      return "exhaustive";
  }
}

String testEnum2(Suit suit) =>
  switch (suit) {
    Suit.club => "club",
    Suit.diamond => "diamond",
    Suit.heart when suit == Suit.heart => "heart1",
    Suit.heart => "heart2",
    Suit.spade => "spade"
  };

String testSealed1(Card card) {
  switch (card) {
    case Pip _ when true:
      return "Pip1";
    case Pip _:
      return "Pip2";
    case Face _:
      return "Face";
  }
}

String testSealed2(Card card) =>
  switch (card) {
    Pip _ => "Pip",
    Face _ when true => "Face1",
    Face _ => "Face2"
  };

main() {
  Expect.equals("false1", testBool1(false));
  Expect.equals("false", testBool2(false));
  Expect.equals("exhaustive", testEnum1(Suit.club));
  Expect.equals("heart1", testEnum2(Suit.heart));
  Expect.equals("Face", testSealed1(Jack(Suit.club)));
  Expect.equals("Face1", testSealed2(Jack(Suit.club)));
}
