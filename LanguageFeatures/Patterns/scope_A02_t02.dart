// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
/// ...
/// Pattern-for-in statement, pattern-for-in element, pattern-for statement,
/// pattern-for element: Scoping follows the normal for and for-in statement and
/// elements scoping rules where the variable (now variables) are bound in a new
/// scope for each loop iteration. All pattern variables are in the same scope.
/// They are considered initialized after the for loop initializer expression.
///
/// @description Checks that it is a compile-time error to refer to the variable
/// declared by the pattern in a pattern-for-in statement outside of its scope
/// @author sgrekhov22@gmail.com

main() {
  {
    print(c);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    for (var [c] in [[1], [2]]) {
      print(c);
    }
    print(c);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  {
    print(c);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    for (final [c] in [[1], [2]]) {
      print(c);
    }
    print(c);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
