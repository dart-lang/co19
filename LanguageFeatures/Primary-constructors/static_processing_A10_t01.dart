// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a primary
/// constructor. Let `p` be a formal parameter of a primary constructor in a
/// class, mixin class, enum, or extension type declaration `D` named `C`:
/// ...
/// Conversely, it is not an error for the modifier `covariant` to occur on a
/// declaring formal parameter `p` of a primary constructor. This extends the
/// existing allowlist of places where `covariant` can occur.
///
/// @description Check that it is not an error if a formal parameters of a
/// primary constructor has the modifier `covariant`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1(covariant var num x);

class D1(int super.x) extends C1;

class C2([covariant var num x = 0]);

class D2(int super.x) extends C2;

class C3({covariant var num x = 0});

class D3({int super.x}) extends C3;

class C4({required covariant var num x});

class D4({required int super.x}) extends C4;

main() {
  Expect.equals(1, D1(1).x);
  Expect.throws(() {
    D1(3.14 as dynamic);
  });

  Expect.equals(2, D2(2).x);
  Expect.throws(() {
    D2(3.14 as dynamic);
  });

  Expect.equals(3, D3(x: 3).x);
  Expect.throws(() {
    D3(x: 3.14 as dynamic);
  });

  Expect.equals(4, D4(x: 4).x);
  Expect.throws(() {
    D4(x: 3.14 as dynamic);
  });
}
