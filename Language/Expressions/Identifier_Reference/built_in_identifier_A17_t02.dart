// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a syntax error if a built-in identifier is used as the
/// declared name of a prefix, class, mixin, enum, type parameter, type alias,
/// or extension.
///
/// @description Checks that it is a compile-time error if a built-in identifier
/// `library` is used as the declared name of a type variable.
/// @author ngl@unipro.ru

class C<library> {
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M<library> {
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E<library> {
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e1;
}

void foo<library>() {}
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext<library> on List {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef int F1<library>();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F2<library extends Comparable<library>> = int Function();
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const void Function<library>()? c = null;
//                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(foo);
  print(List);
  print(F1);
  print(F2);
  print(c);
}
