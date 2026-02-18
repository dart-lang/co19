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
/// @description Check that it is not an error if a declaring parameter of a
/// primary constructor with the name `_` is accessed in the body of the
/// constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C(var int _) {
  this {
    _++;
  }
}

extension type ET(int _) {
  this {
    assert(_ > 0);
  }
}

main() {
  Expect.equals(1, C(0)._);
  ET(1);
}
