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
/// @description Check that generic method instantiation may have a form
/// `super.id`.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class A {
  String foo<X>(X x) => "A:$X";
}

class C extends A {
  int v;
  C(this.v);
  String foo<X>(X x) => "C:$X";

  test() {
    String Function(int) f1 = super.foo;
    Expect.equals("A:${int}", f1(42));
  }
}

void main() {
  C(1).test();
}
