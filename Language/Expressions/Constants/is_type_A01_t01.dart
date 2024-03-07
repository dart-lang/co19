// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e is T is potentially constant if e is a
///   potentially constant expression and T is a constant type expression, and
///   it is further constant if e is constant.
///
/// @description Checks that an expression of the form `e is T` is a constant
/// expression if `e` is a constant expression and `T` is a constant type
/// expression
/// @author sgrekhov22@gmail.com
/// @issue 54620

import "../../../Utils/expect.dart";

class C {
  const C();
}

extension type const IntET1(int _) {}
extension type const IntET2(int _) implements int {}

main() {
  const c1 = 1 is num;
  const c2 = (3.14 as num) is double;
  const c3 = IntET1(1) is int;
  const c4 = IntET2(1) is int;
  const c5 = (IntET1(1),) is (int,);
  const c6 = (IntET2(1),) is (int,);
  const c7 = [IntET1(1)] is List<int>;
  const c8 = [IntET2(1)] is List<num>;
  const c9 = {IntET1(1)} is Set<num>;
  const c10 = {IntET2(1)} is Set<num>;
  const c11 = {IntET1(1): IntET1(2)} is Map<num, int>;
  const c12 = {IntET1(1): IntET2(2)} is Map<num, int>;
  const c13 = {IntET2(1): IntET1(2)} is Map<num, int>;
  const c14 = {IntET2(1): IntET2(2)} is Map<num, int>;
  const c15 = 1 is IntET1;
  const c16 = 1 is IntET2;
  const c17 = IntET1(1) is IntET2;
  const c18 = IntET2(1) is IntET1;
  const c19 = C() is Object;
  const c20 = const C() is Object;
  const c21 = () is ();
  const c22 = (i: 1) is ({num i});

  Expect.isTrue(c1);
  Expect.isTrue(c2);
  Expect.isTrue(c3);
  Expect.isTrue(c4);
  Expect.isTrue(c5);
  Expect.isTrue(c6);
  Expect.isTrue(c7);
  Expect.isTrue(c8);
  Expect.isTrue(c9);
  Expect.isTrue(c10);
  Expect.isTrue(c11);
  Expect.isTrue(c12);
  Expect.isTrue(c13);
  Expect.isTrue(c14);
  Expect.isTrue(c15);
  Expect.isTrue(c16);
  Expect.isTrue(c17);
  Expect.isTrue(c18);
  Expect.isTrue(c19);
  Expect.isTrue(c20);
  Expect.isTrue(c21);
  Expect.isTrue(c22);
}
