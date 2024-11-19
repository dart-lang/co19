// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a compile error to use a `void` expression as
/// an actual parameter. Test an alias of the type `void`.
/// @author sgrekhov22@gmail.com

typedef Void = void;

typedef R1 = (Void v,);
typedef R2 = ({Void v});
extension type ET(Void v) {}

main() {
  R1 r1 = (1,);
  R2 r2 = (v: 2);
  (Void v,) r3 = (3,);
  ({Void v}) r4 = (v: 4);

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
