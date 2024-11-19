// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a compile-time error to implement the type
/// `void` or its alias (this is a syntax error, but there are semantics reasons
/// as well).
/// @author iefremov
/// @issue 39552

typedef Void = void;

class A implements void {}
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C implements Void {}
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET1(void _) implements void {}
//                                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(void _) implements Void {}
//                                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(A);
  print(C);
  print(ET1);
  print(ET2);
}
