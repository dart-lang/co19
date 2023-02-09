// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The static type of a switch expression is the least upper bound of the
/// static types of all of the case expressions.
///
/// @description Check that it is a compile-time error to assign a switch
/// expression to a type `T` such that the standard upper bound of the static
/// types of all its case expressions is not assignable to `T`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main () {
  var x = 42;
  int v1 = switch (x) {
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    42 => 42,
    _ => 3.14
  };

  String v2 = switch (x) {
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    42 => "42",
    _ => false
  };

  num v3 = switch (x) {
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    42 => 42,
    _ => 3.14 as num?
  };
}
