// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A statement of the form:
///
/// for (<patternVariableDeclaration>; <condition>; <increment>) <statement>
///
/// Is executed like a traditional for loop though is more likely to declare
/// multiple variables.
///
/// @description Check that pattern-for statement is executed like a traditional
/// for loop. Test that it is a compile-time error if final variable is assigned
/// in a pattern-for statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";

main() {
  for (final (int i) = 0; i < 3; i++) {
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
    i++;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final [a] = [0]; a < 3; [a] = [a + 1]) {
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
    a++;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final {"k1": a} = {"k1": 0}; a < 3; {"k1": a} = {"k1": a + 1}) {
//                                                ^
// [analyzer] unspecified
// [cfe] unspecified
    a++;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final (a,) = (0,); a < 3; (a,) = (a + 1,)) {
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
    a++;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  for (final Square(:areaAsInt) = Square(1); areaAsInt < 2;
      Square(:areaAsInt) = Square(areaAsInt + 1)) {
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    areaAsInt++;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
