// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Variable:
/// i. If p has a type annotation, the context type schema is the annotated type
///
/// ii. Else the context type schema is _.
///
/// @description Check that if a variable pattern has a type annotation, then
/// the context type schema is the annotated type. Otherwize it is _
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
    var (A v1, v2) = (b, a);
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<A>>();
  }
  {
    final (A v1, v2) = (b, c);
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<C>>();
  }
  B v1 = d;
  v1.expectStaticType<Exactly<B>>();
  var v2 = c;
  v2.expectStaticType<Exactly<C>>();
  final B v3 = d;
  v3.expectStaticType<Exactly<B>>();
  final v4 = c;
  v4.expectStaticType<Exactly<C>>();
}
