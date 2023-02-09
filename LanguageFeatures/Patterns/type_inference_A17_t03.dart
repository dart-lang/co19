// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check the calculation static type of a list pattern. Test that
/// missing types in a type schema are filled from the initialising expression
/// and implicit coercions and casts from dynamic are performed. Test the case
/// when there is a matching rest element
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

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
    var [A v1, ...List<B> r, v2] = [b, c, d, c];
    v1.expectStaticType<Exactly<A>>();
    r.expectStaticType<Exactly<List<B>>>();
    v2.expectStaticType<Exactly<C>>();
  }
  {
    var [A v1, ...r, v2] = [b, c, d, d];
    v1.expectStaticType<Exactly<A>>();
    r.expectStaticType<Exactly<List<D>>>();
    v2.expectStaticType<Exactly<D>>();
  }
  {
    final [A v1, ...r, v2] = <C>[d, d, d, d];
    v1.expectStaticType<Exactly<A>>();
    r.expectStaticType<Exactly<List<C>>>();
    v2.expectStaticType<Exactly<C>>();
  }
  {
    var [A v1, ...List<B> r, v2] = [d as dynamic, d as dynamic, d as dynamic];
    v1.expectStaticType<Exactly<A>>();
    r.expectStaticType<Exactly<List<B>>>();
    v2.expectStaticType<Exactly<B>>();
  }
  var [x1, ...List<double> r] = [1, 2, 3];
  x1.expectStaticType<Exactly<double>>();
  r.expectStaticType<Exactly<List<double>>>();
}
