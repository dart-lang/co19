// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// If there is a primary constructor body part that contains an initializer
/// list then `k2` has an initializer list with the same elements in the same
/// order. If that body part has a function body then `k2` has the same function
/// body.
///
/// @description Check that it is not an error if an instance variable which
/// is implicitly induced by a declaring parameter with the name `_` is accessed
/// in the body of the primary constructor.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class C1(var int _) {
  this {
    _++;
  }
}

class C2(final int _) {
  this {
    assert(_ > 0);
  }
}

class C3([var int _ = 0]) {
  this {
    _++;
  }
}

class C4(final int? _) {
  this {
    assert(_ != null);
  }
}

extension type ET1(int _) {
  this {
    assert(_ > 0);
  }
}

extension type ET2([int? _]) {
  this {
    assert(_ != null);
  }
}

main() {
  Expect.equals(1, C1(0)._);
  Expect.equals(2, C2(2)._);
  Expect.equals(4, C3(3)._);
  Expect.equals(4, C4(4)._);
  Expect.equals(1, ET1(1)._);
  Expect.equals(2, ET2(2)._);
}
