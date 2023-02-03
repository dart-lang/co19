// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Null-assert: A context type schema E? where E is the context type schema of
/// the inner pattern
///
/// @description Check that the context type schema for null-asser pattern is a
/// context type schema E? where E is the context type schema of the inner
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

main() {
  A? a = A();
  B? b = B();
  C? c = C();
  D? d = D();
  {
    var [A? v1, B? v2, v3]! = [b, c, c];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<C>>();
  }
  {
    final [A? v1, B? v2, v3]! = [b, c, d];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<D>>();
  }
  {
    var [A? v1, B? v2, v3]! = <C?>[d, d, d];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<C>>();
  }
  try {
    final [A? v1, B? v2, v3]! = [];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
  } catch (_) {}
}
