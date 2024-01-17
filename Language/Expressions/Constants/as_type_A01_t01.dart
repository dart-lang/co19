// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e as T is potentially constant if e is a
///   potentially constant expression and T is a constant type expression, and
///   it is further constant if e is constant.
///
/// @description Checks that an expression of the form `e as T` is a constant
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
  const c1 = 1 as num;
  const c2 = (3.14 as num) as double;
  const c3 = IntET1(1) as int;
  const c4 = IntET2(1) as int;
  const c5 = (IntET1(1),) as (int,);
  const c6 = (IntET2(1),) as (int,);
  const c7 = [IntET1(1)] as List<int>;
  const c8 = [IntET2(1)] as List<num>;
  const c9 = {IntET1(1)} as Set<num>;
  const c10 = {IntET2(1)} as Set<num>;
  const c11 = {IntET1(1): IntET1(2)} as Map<num, int>;
  const c12 = {IntET1(1): IntET2(2)} as Map<num, int>;
  const c13 = {IntET2(1): IntET1(2)} as Map<num, int>;
  const c14 = {IntET2(1): IntET2(2)} as Map<num, int>;
  const c15 = 1 as IntET1;
  const c16 = 1 as IntET2;
  const c17 = IntET1(1) as IntET2;
  const c18 = IntET2(1) as IntET1;
  const c19 = C() as Object;
  const c20 = const C() as Object;

  Expect.identical(1, c1);
  Expect.identical(3.14, c2);
  Expect.identical(1, c3);
  Expect.identical(1, c4);
  Expect.identical(const (1,), c5);
  Expect.identical(const (1,), c6);
  Expect.identical(const [1], c7);
  Expect.identical(const [1], c8);
  Expect.identical(const {1}, c9);
  Expect.identical(const {1}, c10);
  Expect.identical(const {1: 2}, c11);
  Expect.identical(const {1: 2}, c12);
  Expect.identical(const {1: 2}, c13);
  Expect.identical(const {1: 2}, c14);
  Expect.identical(1, c15);
  Expect.identical(1, c16);
  Expect.identical(1, c17);
  Expect.identical(1, c18);
  Expect.identical(const C(), c19);
  Expect.identical(const C(), c20);
}
