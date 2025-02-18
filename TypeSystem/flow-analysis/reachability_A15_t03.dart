// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Conditional assignment to a non local-variable: If `N` is an
/// expression of the form `E1 ??= E2` where `E1` is not a local variable, and
/// the type of `E1` is `T1`, then:
/// - Let `before(E1) = before(N)`.
/// - If `T1` is strictly non-nullable, then:
///   - Let `before(E2) = unreachable(after(E1))`.
///   - Let `after(N) = after(E1)`.
/// - Otherwise:
///   - Let before(E2) = split(after(E1)).
///   - Let after(N) = merge(after(E2), split(after(E1))).
///
/// @description Checks that if `E1` is not a local variable and is nullable,
/// then flow analysis doesn't promote `E1`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {}
class B extends A {
  void foo() {}
}

A? o;

class C {
  A? m;
  test() {
    m ??= B();
    m.expectStaticType<Exactly<A?>>();
  }
}

main() {
  o ??= B();
  o.expectStaticType<Exactly<A?>>();
  C().test();
}
