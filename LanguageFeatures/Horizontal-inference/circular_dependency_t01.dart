// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that horizontal inference doesn't work in case of
/// the circular dependency
/// @author sgrekhov22@gmail.com

void f<X, Y>(X Function(Y) a, Y Function(X) b) {}

main() {
  f((v) => 42, (u) {
    u.isOdd; // u is `Object?` here
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    u?.isOdd;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Lily was here";
  });

  f((v) {
    v.substring(0); // v is `Object?` here
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    v?.substring(0);
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 42;
  }, (u) {
    return "Lily was here";
  });
}
