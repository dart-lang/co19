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
/// @description Check that any cases with guards are ignored when calculating
/// an exhaustiveness
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,class-modifiers

import "exhaustiveness_lib.dart";

String testBool1(bool b) {
  switch (b) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case true:
      return "true";
    case false when b == false:
      return "false";
  }
}

String testBool2(bool b) => switch (b) {
//                          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      true when b == true => "true",
      false => "false"
    };

String testEnum1(Suit suit) {
  switch (suit) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Suit.club:
    case Suit.diamond:
    case Suit.heart when suit == Suit.heart:
    case Suit.spade:
      return "exhaustive";
  }
// There is no return statement here, switch statement is not exhaustive, so an
// error above occurs because function return type cannot be null
}

String testEnum2(Suit suit) => switch (suit) {
//                             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      Suit.club => "club",
      Suit.diamond => "diamond",
      Suit.heart when suit == Suit.heart => "heart",
      Suit.spade => "spade"
    };

String testSealed1(Card card) {
  switch (card) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Pip _ when true:
      return "Pip";
    case Face _:
      return "Face";
  }
}

String testSealed2(Card card) => switch (card) {
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      Pip _ => "Pip",
      Face _ when true => "Face"
    };

main() {
  testBool1(true);
  testBool2(false);
  testEnum1(Suit.club);
  testEnum2(Suit.club);
  testSealed1(Jack(Suit.club));
  testSealed2(Jack(Suit.club));
}
