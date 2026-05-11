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
/// @description Check that static type of `switch` expressions is calculated
/// using the same rules as for conditional expression (the context type is
/// taken into account).
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {}
class B extends A {}
class D implements A {}

class C1 extends D implements B {}
class C2 extends D implements B {}

main() {
  B b = switch(1 + 2) {
    1 => C1(),
    _ => C2()
  };
  D d = switch(1 + 2) {
    2 => C1(),
    _ => C2()
  };
  var x = switch(1 + 2) {
    3 => C1(),
    _ => C2()
  };
  x.expectStaticType<Exactly<A>>();
}
