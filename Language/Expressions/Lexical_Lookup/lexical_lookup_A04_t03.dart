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
/// ...
/// - Consider the case where `D` is an instance member declaration in a class
///   or mixin `A`. The lexical lookup then yields nothing.
///
/// @description Checks that when `D` is an instance member declaration then
/// lexical lookup yields nothing. Test the case when `this.n` exists (declared
/// in an extension) and it is not an error.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class A {}

extension Ext on A {
  int get foo => 1;
}

class C extends A {
  test() {
    Expect.equals(1, foo);
  }
}

mixin M on A {
  test() {
    Expect.equals(1, foo);
  }
}

extension Ext2 on A {
  test() {
    Expect.equals(1, foo);
  }
}

extension type ET(A _) implements A {
  test() {
    Expect.equals(1, foo);
  }
}

class MA = A with M;

main() {
  C().test();
  MA().test();
  A().test();
  ET(A()).test();
}
