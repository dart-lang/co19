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
/// @description Checks that it is not an error if the name of `D` exists.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

final int foo = 0;

class A {
  int get foo => 1;
}

class C extends A {
  test() {
    Expect.equals(0, foo);
    Expect.equals(1, this.foo);
  }
}

mixin M on A {
  test() {
    Expect.equals(0, foo);
    Expect.equals(1, this.foo);
  }
}

extension Ext on A {
  test() {
    Expect.equals(0, foo);
    Expect.equals(1, this.foo);
  }
}

extension type ET(A _) implements A {
  test() {
    Expect.equals(0, foo);
    Expect.equals(1, this.foo);
  }
}

class MA = A with M;

main() {
  C().test();
  MA().test();
  A().test();
  ET(A()).test();
}
