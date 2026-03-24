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
/// Case ⟨`D` exists⟩. In this case, at least one declaration with basename `id`
/// is in scope at the location `ℓ`. It is a compile-time error if the name of
/// `D` is not `n`, unless `D` is an instance member or a local variable.
/// ...
/// If `D` is an instance member, it is a compile-time error if `ℓ` does not
/// have access to `this`.
///
/// @description Checks that it is a compile-error if `D` is an instance member
/// and `ℓ` does not have access to `this`.
/// @author sgrekhov22@gmail.com

class C {
  int cInstanceMember = 0;

  static void test() {
    print(cInstanceMember);
//        ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M {
  int mInstanceMember = 0;

  static void test() {
    print(mInstanceMember);
//        ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e0;
  final int eInstanceMember = 0;

  static void test() {
    print(eInstanceMember);
//        ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int etInstanceMember) {
  static void test() {
    print(etInstanceMember);
//        ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
