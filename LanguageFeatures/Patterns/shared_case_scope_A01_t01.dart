// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a switch statement, multiple cases may share the same body.
/// ...
/// We specify how this behaves by creating a new shared case scope that
/// contains all variables from all of the cases and then report errors from
/// invalid uses of them. The shared case scope s of a body used by a set of
/// cases with pattern variable sets vs (where default cases and labels have
/// empty pattern variable sets) is:
///
/// 1. Create a new empty scope s whose enclosing scope is the scope surrounding
///   the switch statement or expression.
///
/// 2. For each name n appearing as a variable name in any of the pattern
///   variable sets in vs:
///
/// i. If n is defined in every pattern variable set in vs and has the same type
///   and finality, then introduce n into s with the same type and finality.
///   This is a shared variable and is available for use in the body.
///
///   If any of the corresponding variables in vs are promoted, calculate the
///   promoted type of the variable in s based on all of the promoted types of n
///   in the cases in the same way that promotions are merged at join points.
///
/// ii. Else n is not consistently defined by all cases and thus isn't safe to
///   use in the body. Introduce a new variable n into s with unspecified type
///   and finality.
///
/// 3. Compile the body in s. It is a compile-time error if any identifier in
///   the body resolves to a variable in s that isn't shared.
///
/// @description Checks that it is a compile-time error if any identifier in the
/// body resolves to a variable in s that isn't shared.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main() {
  switch (42) {
    case var a when a == 0:
      print(a);
      break;
    case var a when a == 42:
    case var a:
    case var b:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case final a when a == -1:
      print(a);
      break;
  }

  switch (42) {
    case var a when a == 0:
      print(a);
      break;
    case final a when a == 42:
    case 42:
    case final a:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case final a when a == -1:
      print(a);
      break;
  }

  switch (42) {
    case var a when a == 0:
      print(a);
      break;
    case var a when a == 42:
    case var a:
    case var _:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case final a when a == -1:
      print(a);
      break;
  }
}
