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
/// Case ⟨`D` does not exist⟩. It is a compile-time error if `ℓ` does not have
/// access to `this`.
///
/// @description Checks that it is a compile-error if `D` does not exist and `ℓ`
/// does not have access to `this`.
/// @author sgrekhov22@gmail.com

class C {
  static void test() {
    print(notExisting);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M {
  static void test() {
    print(notExisting);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e0;

  static void test() {
    print(notExisting);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int _) {
  static void test() {
    print(notExisting);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var v = notExisting;
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
