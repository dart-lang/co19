// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a declaring
/// constructor, be it in the header or in the body. Let `p` be a formal
/// parameter of a declaring constructor in a class, enum, or extension type
/// declaration `D` named `C`:
/// ...
/// Conversely, it is not an error for the modifier `covariant` to occur on a
/// declaring formal parameter `p` of a declaring constructor. This extends the
/// existing allowlist of places where `covariant` can occur.
///
/// @description Check that it is not an error if a formal parameters of a
/// declaring constructor has the modifier `covariant`.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

class C1(covariant var num x);

class D1(int super.x) extends C1;

class C2([covariant var num x = 0]);

class D2(int super.x) extends C2;

class C3({covariant var num x = 0});

class D3({int super.x}) extends C3;

class C4({required covariant var num x});

class D4({required int super.x}) extends C4;

class C5 {
  this(covariant var num x);
}

class D5(int super.x) extends C5;

class C6 {
  this([covariant var num x = 0]);
}

class D6(int super.x) extends C6;

class C7 {
  this({covariant var num x = 0});
}

class D7({int super.x}) extends C7;

class C8 {
  this({required covariant var num x});
}

class D8({required int super.x}) extends C8;

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

  Expect.equals(5, D5(5).x);
  Expect.throws(() {
    D5(3.14 as dynamic);
  });

  Expect.equals(6, D6(6).x);
  Expect.throws(() {
    D6(3.14 as dynamic);
  });

  Expect.equals(7, D7(x: 7).x);
  Expect.throws(() {
    D7(x: 3.14 as dynamic);
  });

  Expect.equals(8, D8(x: 8).x);
  Expect.throws(() {
    D8(x: 3.14 as dynamic);
  });
}
