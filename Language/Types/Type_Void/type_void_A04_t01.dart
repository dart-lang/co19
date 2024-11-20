// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that specifying `void` as a type parameter bound causes
/// a compile-time error (which is a syntax error).
/// @author iefremov

void f<T extends void>() {}
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

class A<T extends void> {}
//                ^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B {
  static void foo<T extends void>() {}
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void bar<T extends void>() {}
//                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M<T extends void> {}
//                ^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E<T extends void> {
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}

class C {}
extension Ext<T extends void> on C {}
//                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET<T extends void>(int _) {}
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(A);
  print(M);
  print(E);
  print(C);
  print(ET);
}
