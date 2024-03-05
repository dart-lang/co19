// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a syntax error if a built-in identifier is used as the
/// declared name of a prefix, class, mixin, enum, type parameter, type alias,
/// or extension.
///
/// @description Checks that it is a compile-time error if a built-in identifier
/// `operator` is used as the declared name of a type variable.
/// @author rodionov

class C<operator> {
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M<operator> {
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E<operator> {
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e1;
}

void foo<operator>() {}
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext<operator> on List {}
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef int F1<operator>();
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F2<operator extends Comparable<operator>> = int Function();
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const void Function<operator>()? c = null;
//                  ^^^^^^^^
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
