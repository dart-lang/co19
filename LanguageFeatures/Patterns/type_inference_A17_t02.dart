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
/// missing types in a type schema are filled in from the initializing
/// expression
/// @author sgrekhov22@gmail.com

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
    var [A v1, B v2, v3] = <B>[b, c, c];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
  }
  {
    var [A v1, B v2, v3] = <C>[c, c, d];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<C>>();
  }
  {
    var [A v1, B v2, v3] = <D>[d, d, d];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<D>>();
  }
}
