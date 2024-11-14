// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a compile error to use a `void` expression as
/// an actual parameter.
/// @author sgrekhov22@gmail.com

typedef R1 = (void v,);
typedef R2 = ({void v});
extension type ET(void v) {}

main() {
  R1 r1 = (1,);
  R2 r2 = (v: 2);
  (void v,) r3 = (3,);
  ({void v}) r4 = (v: 4);

  print(ET(1).v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  print(r1.$1);
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  print(r2.v);
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  print(r3.$1);
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(r4.v);
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
