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
/// @description Checks that it is a compile-error if the name of `D` is not `n`
/// @author sgrekhov22@gmail.com

void set setter(int v) {}

int get getter => 0;

final int variable = 1;

const constant = 2;

main() {
  print(setter);
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  getter = 0;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  variable = 0;
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  constant = 0;
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
