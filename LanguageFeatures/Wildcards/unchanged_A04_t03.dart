// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that any top-level declaration named `_` is a
/// compile-time error if there is an earlier declaration of a top-level
/// function named `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

void _() {}

int _ = 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

const _ = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

int _() => 42;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

int get _ => 42;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

class _ {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

mixin _ {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

enum _ {e1;}
//   ^
// [analyzer] unspecified
// [cfe] unspecified

extension type _(int id) {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

class A {}
extension _ on A {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified

typedef _ = A;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void _();
//           ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
