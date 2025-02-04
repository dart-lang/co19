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
/// @description Check that it is a run-time error if a generic method
/// tear-off cannot be assigned to a non-generic function.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C<T extends num> {
  X foo<X extends T>(X x) => x;
}

void main() {
  C<num> c = C<int>();
  Expect.throws(() {
    num Function(num) f = c.foo;
  });
}
