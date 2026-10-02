// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion But in a non-pattern assignment, `_` is treated as a normal
/// identifier. If it resolves to something assignable (which now must mean a
/// member or top-level declaration), the assignment is valid.
///
/// @description Checks that a non-pattern assignment to `_` is valid when `_`
/// resolves to an assignable member or top-level variable. Test various
/// assignment operators, `this._`, `super._`, a cascade, and a null-aware
/// assignment.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

dynamic _ = -1;

class A {
  var _;
}

class C extends A {
  var _;

  C test() {
    Expect.equals(16, _ = 16);
    Expect.equals(16, _);
    Expect.equals(18, _ += 2);
    Expect.equals(18, _);
    Expect.equals(14, _ -= 4);
    Expect.equals(14, _);
    Expect.equals(28, _ *= 2);
    Expect.equals(28, _);
    Expect.equals(5, _ ~/= 5);
    Expect.equals(5, _);
    Expect.equals(2, _ %= 3);
    Expect.equals(2, _);
    Expect.equals(8, _ <<= 2);
    Expect.equals(8, _);
    Expect.equals(4, _ >>= 1);
    Expect.equals(4, _);
    Expect.equals(2, _ >>>= 1);
    Expect.equals(2, _);
    Expect.equals(2, _ &= 3);
    Expect.equals(2, _);
    Expect.equals(3, _ |= 1);
    Expect.equals(3, _);
    Expect.equals(4, _ ^= 7);
    Expect.equals(4, _);
    Expect.equals(null, _ = null);
    Expect.equals(9, _ ??= 9);
    Expect.equals(9, _);
    Expect.equals(9, _ ??= 1);
    Expect.equals(9, _);
    Expect.equals(10, _ = 10);
    Expect.equals(2.5, _ /= 4);
    Expect.equals(2.5, _);

    Expect.equals(4, this._ = 4);
    Expect.equals(4, this._);
    Expect.equals(5, this._ += 1);
    Expect.equals(5, this._);
    Expect.equals(null, this._ = null);
    Expect.equals(6, this._ ??= 6);
    Expect.equals(6, this._ ??= 1);
    Expect.equals(6, this._);

    Expect.equals(2, super._ = 2);
    Expect.equals(2, super._);
    Expect.equals(5, super._ += 3);
    Expect.equals(5, super._);
    Expect.equals(null, super._ = null);
    Expect.equals(4, super._ ??= 4);
    Expect.equals(4, super._ ??= 1);
    Expect.equals(4, super._);

    return this;
  }
}

class S {
  static var _;

  static void test() {
    Expect.equals(16, _ = 16);
    Expect.equals(16, _);
    Expect.equals(18, _ += 2);
    Expect.equals(18, _);
    Expect.equals(14, _ -= 4);
    Expect.equals(14, _);
    Expect.equals(28, _ *= 2);
    Expect.equals(28, _);
    Expect.equals(5, _ ~/= 5);
    Expect.equals(5, _);
    Expect.equals(2, _ %= 3);
    Expect.equals(2, _);
    Expect.equals(8, _ <<= 2);
    Expect.equals(8, _);
    Expect.equals(4, _ >>= 1);
    Expect.equals(4, _);
    Expect.equals(2, _ >>>= 1);
    Expect.equals(2, _);
    Expect.equals(2, _ &= 3);
    Expect.equals(2, _);
    Expect.equals(3, _ |= 1);
    Expect.equals(3, _);
    Expect.equals(4, _ ^= 7);
    Expect.equals(4, _);
    Expect.equals(null, _ = null);
    Expect.equals(9, _ ??= 9);
    Expect.equals(9, _);
    Expect.equals(9, _ ??= 1);
    Expect.equals(9, _);
    Expect.equals(10, _ = 10);
    Expect.equals(2.5, _ /= 4);
    Expect.equals(2.5, _);
  }
}

void testTopLevel() {
  Expect.equals(16, _ = 16);
  Expect.equals(16, _);
  Expect.equals(18, _ += 2);
  Expect.equals(18, _);
  Expect.equals(14, _ -= 4);
  Expect.equals(14, _);
  Expect.equals(28, _ *= 2);
  Expect.equals(28, _);
  Expect.equals(5, _ ~/= 5);
  Expect.equals(5, _);
  Expect.equals(2, _ %= 3);
  Expect.equals(2, _);
  Expect.equals(8, _ <<= 2);
  Expect.equals(8, _);
  Expect.equals(4, _ >>= 1);
  Expect.equals(4, _);
  Expect.equals(2, _ >>>= 1);
  Expect.equals(2, _);
  Expect.equals(2, _ &= 3);
  Expect.equals(2, _);
  Expect.equals(3, _ |= 1);
  Expect.equals(3, _);
  Expect.equals(4, _ ^= 7);
  Expect.equals(4, _);
  Expect.equals(null, _ = null);
  Expect.equals(9, _ ??= 9);
  Expect.equals(9, _);
  Expect.equals(9, _ ??= 1);
  Expect.equals(9, _);
  Expect.equals(10, _ = 10);
  Expect.equals(2.5, _ /= 4);
  Expect.equals(2.5, _);
}

main() {
  Expect.equals(6, C().test()._);
  Expect.equals(-1, _);

  C c = C();
  c.._ = 1.._ += 2;
  Expect.equals(3, c._);
  c.._ = null.._ ??= 7;
  Expect.equals(7, c._);
  Expect.equals(-1, _);

  C? nullable = C();
  Expect.equals(2, nullable?._ = 2);
  Expect.equals(2, nullable._);
  Expect.equals(5, nullable?._ += 3);
  Expect.equals(5, nullable._);
  Expect.equals(null, nullable?._ = null);
  Expect.equals(4, nullable?._ ??= 4);
  Expect.equals(4, nullable?._ ??= 1);
  Expect.equals(4, nullable._);

  C? absent;
  Expect.isNull(absent?._ = 1);
  Expect.isNull(absent?._ += 1);
  Expect.isNull(absent?._ ??= 1);

  S.test();
  Expect.equals(2.5, S._);
  Expect.equals(-1, _);

  testTopLevel();
  Expect.equals(2.5, _);
}
