// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `i` be a property extraction expression of the form `e?.id`,
/// `e.id`, or `super.id`, which is statically resolved to denote an instance
/// method named `id`, and let `G` be the static type of `i`. Consider the
/// situation where `G` is a function type of the form
/// `T0 Function<X1 ◁B1, ..., Xs ◁Bs>(parameters)` with `s > 0` (that is, `G` is
/// a generic function type), and the context type is a non-generic function
/// type `F`. In this situation a compile-time error occurs, except when generic
/// function type instantiation succeeds, that is:
///
/// Type inference is applied to `G` with context type `F`, and it succeeds,
/// yielding the actual type argument list `T1, ..., Ts`.
///
/// @description Check that it is not an error if a type inference is applied to
/// `G` with context type `F`, and it succeeds
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class A {
  X fi<X extends num>(X x) => x;
}

class B extends A {
  X fi<X extends num>(X x, [List<X>? xs]) => x;
}

void main() {
  A a = B();
  int Function(int) f = a.fi;
  Expect.equals(42, f(42));
  Expect.equals(42, (f as dynamic)(42, [0]));
}
