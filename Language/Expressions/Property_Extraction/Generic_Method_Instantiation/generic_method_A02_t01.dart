// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `i` be a property extraction expression of the form `e?.id`,
/// `e.id`, or `super.id`, which is statically resolved to denote an instance
/// method named `id`, and let `G` be the static type of `i`. Consider the
/// situation where `G` is a function type of the form
/// `T0 Function<X1 ◁B1, ..., Xs ◁Bs>(parameters)` with `s > 0` (that is, `G` is
/// a generic function type), and the context type is a non-generic function
/// type `F`.
/// ...
/// Consider the situation where generic function type instantiation succeeded.
/// Let `gmiNameid` be a fresh name which is associated with `id`, which is
/// private `if` and only if id is private.
/// ...
/// The program is then modified as follows:
/// • When `i` is `e?.id`: Replace `i` by `e?.gmiNameid<T1, ..., Ts>()`.
/// • When `i` is `e.id`: Replace `i` by `e.gmiNameid<T1, ..., Ts>()`.
/// • When `i` is `super.id`: Replace `i` by `super.gmiNameid<T1, ..., Ts>()`.
///
/// @description Check that generic method instantiation may have a form `e?.id`
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C {
  int v;
  C(this.v);
  X foo<X extends num>(X x) => x + v as X;
}

void main() {
  C? c1 = 2 > 1 ? C(1) : null;
  int Function(int)? f1 = c1?.foo;
  Expect.equals(c1?.foo(42), f1?.call(42));

  C? c2 = 1 > 2 ? C(1) : null;
  double Function(double)? f2 = c2?.foo;
  Expect.isNull(f2);
}
