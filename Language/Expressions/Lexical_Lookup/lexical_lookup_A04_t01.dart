// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider the situation where a name `n` has basename `id` where
/// `id` is an identifier, and a lexical lookup of `n` is performed from a given
/// location `ℓ`.
/// ...
/// Let `S` be the innermost lexical scope containing `ℓ` which has a
/// declaration with basename `id`. In the case where `S` has a declaration
/// named `id` as well as a declaration named `id=`, let `D` be the declaration
/// named `n`. In the situation where `S` has exactly one declaration with
/// basename `id`, let `D` be that declaration.
/// ...
/// In the second and last step, if no error occurred, proceed as described in
/// the first applicable case from the following list:
/// - When `D` does not exist, the lexical lookup yields nothing.
///
/// @description Checks that when `D` does not exist, the lexical lookup yields
/// nothing. Test the case when `this.n` doesn't exists and this is a
/// compile-time error.
/// @author sgrekhov22@gmail.com

class A {
  static int get foo => 1;
}

class C extends A {
  test() {
    print(foo);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M on A {
  test() {
    print(foo);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension Ext on A {
  test() {
    print(foo);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(A _) implements A {
  test() {
    print(foo);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(A);
  print(C);
  print(M);
  print(ET);
}
