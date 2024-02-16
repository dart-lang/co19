// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be an expression; e occurs in a constant context iff one of
/// the following applies:
/// • e is an element of a list or set literal whose first token is const, or e
///   is a key or a value of an entry of a map literal whose first token is
///   const.
///
/// @description Checks that it is a compile-time error if `e` is an element of
/// a list or set literal whose first token is `const`, or `e` is a key or a
/// value of an entry of a map literal whose first token is `const` but `e` is
/// not a constant expression.
/// @author sgrekhov22@gmail.com

class C {
  final val;
  C(this.val);
}

main() {
  const c1 = const [C(1)];
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c2 = const {C(2)};
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c3 = const {C(3): 0};
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c4 = const {0: C(4)};
//                     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
