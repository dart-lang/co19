// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A conditional expression `E` of the form `b ? e1 : e2` with
/// context type `K` is analyzed as follows:
/// - Let `T1` be the type of `e1` inferred with context type `K`
/// - Let `T2` be the type of `e2` inferred with context type `K`
/// - Let `T` be `UP(T1, T2)`
/// - Let `S` be the greatest closure of `K`
/// - If `T <: S` then the type of `E` is `T`
/// - Otherwise, if `T1 <: S` and `T2 <: S`, then the type of `E` is `S`
/// - Otherwise, the type of `E` is `T`
///
/// @description Check that static type of `??` expressions is calculated using
/// the same rules as for conditional expression (the context type is taken into
/// account).
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {}
class B extends A {}
class D implements A {}

class C1 extends D implements B {}
class C2 extends D implements B {}

test(C1? c1) {
  B b = c1 ?? C2();
  D d = c1 ?? C2();
  var x = c1 ?? C2();
  x.expectStaticType<Exactly<A>>();
}

main() {
  test(C1());
}
