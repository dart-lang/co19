// Copyright (c) 2023 the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a local variable is referenced at a
/// source code location that is before the end of its initializing expression,
/// if any, and otherwise before the declaring occurrence of the identifier
/// which names the variable.
///
/// @description Checks that a variable is introduced into the scope after a
/// variable declaration statement is evaluated, and the name of this variable
/// cannot be used in its initialization.
/// @author sgrekhov22@gmail.com

var x = 0;

f(y) {
  var z = x;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  if (y) {
    x = x + 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    print(x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var x = x++;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  print(x);
}

main() {
  f(true);
}
