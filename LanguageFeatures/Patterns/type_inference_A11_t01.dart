// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check the calculation static type of a logical-and pattern.
/// Test that missing types in a type schema are filled in from the initializing
/// expression
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
    // It's important to specify type arguments of the initializing expression
    // here and below to avoid a type inference from the pattern type schema to
    // a initializing expression
    var ([A x1, x2] && [y1, B y2]) = <B>[b, c];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<B>>();
    y1.expectStaticType<Exactly<B>>();
    y2.expectStaticType<Exactly<B>>();
  }
  {
    final ([A x1, x2] && [y1, B y2]) = <C>[c, d];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<C>>();
    y1.expectStaticType<Exactly<C>>();
    y2.expectStaticType<Exactly<B>>();
  }
  {
    var ([A x1, x2] && [y1, B y2]) = <B>[b, b];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<B>>();
    y1.expectStaticType<Exactly<B>>();
    y2.expectStaticType<Exactly<B>>();
  }
  {
    final ([A x1, x2] && [y1, B y2]) = <C>[d, d];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<C>>();
    y1.expectStaticType<Exactly<C>>();
    y2.expectStaticType<Exactly<B>>();
  }
}
