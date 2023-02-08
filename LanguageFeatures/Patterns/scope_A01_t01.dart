// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
///
/// Pattern variable declaration: The scope enclosing the variable declaration
/// statement.
///
/// The initializing expression for every variable in the pattern is the pattern
/// variable declaration's initializer.
///
/// @description Checks that it is a compile-time error to refer to the variable
/// declared by the pattern until after the pattern variable declaration's
/// initializer
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

const c = 1;

test() {
  print(c);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  var [c] = [c];
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  print(c);
}

main() {
  test();
  print(c);
  {
    print(c);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    var [c] = [c];
//             ^
// [analyzer] unspecified
// [cfe] unspecified
    print(c);
  }
  print(c);
}
