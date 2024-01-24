// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e is! T is equivalent to !(e is T) in every
///   way, including whether it’s potentially constant or constant.
///
/// @description Checks that an expression of the form `e is! T` is a constant
/// expression if `e` is a constant expression and `T` is a constant type
/// expression
/// @author sgrekhov22@gmail.com
/// @issue 54620

// SharedOptions=--enable-experiment=inline-class

import "../../../Utils/expect.dart";

class C {
  const C();
}

extension type const IntET1(int _) {}
extension type const IntET2(int _) implements int {}

main() {
  const c1 = 1 is! num;
  const c2 = (3.14 as num) is! double;
  const c3 = IntET1(1) is! int;
  const c4 = IntET2(1) is! int;
  const c5 = (IntET1(1),) is! (int,);
  const c6 = (IntET2(1),) is! (int,);
  const c7 = [IntET1(1)] is! List<int>;
  const c8 = [IntET2(1)] is! List<num>;
  const c9 = {IntET1(1)} is! Set<num>;
  const c10 = {IntET2(1)} is! Set<num>;
  const c11 = {IntET1(1): IntET1(2)} is! Map<num, int>;
  const c12 = {IntET1(1): IntET2(2)} is! Map<num, int>;
  const c13 = {IntET2(1): IntET1(2)} is! Map<num, int>;
  const c14 = {IntET2(1): IntET2(2)} is! Map<num, int>;
  const c15 = 1 is! IntET1;
  const c16 = 1 is! IntET2;
  const c17 = IntET1(1) is! IntET2;
  const c18 = IntET2(1) is! IntET1;
  const c19 = C() is! Object;
  const c20 = const C() is! Object;
  const c21 = () is! ();
  const c22 = (i: 1) is! ({num i});

  Expect.isFalse(c1);
  Expect.isFalse(c2);
  Expect.isFalse(c3);
  Expect.isFalse(c4);
  Expect.isFalse(c5);
  Expect.isFalse(c6);
  Expect.isFalse(c7);
  Expect.isFalse(c8);
  Expect.isFalse(c9);
  Expect.isFalse(c10);
  Expect.isFalse(c11);
  Expect.isFalse(c12);
  Expect.isFalse(c13);
  Expect.isFalse(c14);
  Expect.isFalse(c15);
  Expect.isFalse(c16);
  Expect.isFalse(c17);
  Expect.isFalse(c18);
  Expect.isFalse(c19);
  Expect.isFalse(c20);
  Expect.isFalse(c21);
  Expect.isFalse(c22);
}
