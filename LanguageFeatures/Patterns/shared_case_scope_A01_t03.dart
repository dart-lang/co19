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
/// body resolves to a variable in s that isn't shared. Test the case when the
/// variable is defined in every pattern variable set but with different type or
/// finality.
/// @author sgrekhov22@gmail.com

main() {
  switch ([1, 2, 3]) {
    case [var a, 2, 3]:
    case [1, 2, ...var a]:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }

  switch ([1, 2, 3]) {
    case [final a, 2, 3]:
    case [1, ...final a, 3]:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
  }

  switch (42) {
    case var a as num:
    case var a as int:
//  ^^^^
// [analyzer] WARNING.UNREACHABLE_SWITCH_CASE
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }

  switch(42 as num) {
    case var a when a is int:
    case int a:
    case double a:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  switch (42 as int?) {
    case var a? when a == 0:
    case int? a when a != null:
    case int? a! when a == 2:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  switch (42 as int?) {
    case int a? when a is Never:
    case int? a when a != null:
    case int? a! when a == 2:
      print(a);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
