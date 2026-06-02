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
///
/// Where no processing is mentioned below, `D2` is identical to `D`. Changes
/// occur as follows:
///
/// Let `p` be a formal parameter in `k` which has the modifier `var` or the
/// modifier `final` (that is, `p` is a declaring parameter).
///
/// Consider the situation where `p` has no type annotation:
/// ...
/// - otherwise, if `p` does not have a default value then `p` has declared type
///   `Object?`.
///
/// @description Check that if p has neither a declared type nor a `var` or
/// `final` modifier, then its static type is `dynamic`. Test classes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1(x) {
  bool didThrow = false;
  this {
    try {
      x.checkDynamic;
    } catch (_) {
      didThrow = true;
    }
  }
}

class C2([x]) {
  bool didThrow = false;
  this {
    try {
      x.checkDynamic;
    } catch (_) {
      didThrow = true;
    }
  }
}

class C3({x}) {
  bool didThrow = false;
  this {
    try {
      x.checkDynamic;
    } catch (_) {
      didThrow = true;
    }
  }
}

class C4({required x}) {
  bool didThrow = false;
  this {
    try {
      x.checkDynamic;
    } catch (_) {
      didThrow = true;
    }
  }
}

main() {
  Expect.isTrue(C1(1).didThrow);
  Expect.isTrue(C2(2).didThrow);
  Expect.isTrue(C3(x: 3).didThrow);
  Expect.isTrue(C4(x: 4).didThrow);
}
