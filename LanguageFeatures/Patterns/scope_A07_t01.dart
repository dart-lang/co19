// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
/// ...
/// Switch statement, switch expression, if-case statement, if-case-element:
/// Each guardedPattern introduces a new case scope which is where the variables
/// defined by that case's pattern are bound.
/// ...
/// The then statement of an if-case statement is executed in a new scope whose
/// enclosing scope is the case's case scope.
///
/// @description Checks that it is a compile-time error if a variable defined in
/// a case's scope of if-case statement is referenced in its `then` branch
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main() {
  if (42 case var v1) {
    print(v1);
  } else {
    print(v1);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  if (42 case final v2 when var z = 1 > 0) {
    print(z);
  } else {
    print(z);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
