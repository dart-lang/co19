// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching
///
/// @description Check that the static type of a record pattern is a record type
/// schema with the holes filled in by an initializing expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

main() {
  A a = A();
  B b = B();
  C c = C();
  D d = D();
  {
    var (A v1, v2, n1: B v3, n2: v4) = (a, b, n1: c, n2: d);
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
    v4.expectStaticType<Exactly<D>>();
  }
  {
    var (A v1, v2, n1: B v3, n2: v4) = (d, d, n1: d, n2: d);
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<D>>();
    v3.expectStaticType<Exactly<B>>();
    v4.expectStaticType<Exactly<D>>();
  }
  {
    var (A v1, v2, n1: B v3, n2: v4) = (d as C, d as C, n1: d as C, n2: d as C);
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<C>>();
    v3.expectStaticType<Exactly<B>>();
    v4.expectStaticType<Exactly<C>>();
  }
}
