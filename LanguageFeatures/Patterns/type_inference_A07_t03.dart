// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// List: A context type schema List<E> where:
///
/// i. If p has a type argument, then E is the type argument.
///
/// ii. Else if p has no elements then E is _.
///
/// iii. Else, infer the type schema from the elements:
///   a. Let es be an empty list of type schemas.
///   b. For each element e in p:
///     a. If e is a matching rest element with subpattern s and the context
///         type schema of s is an Iterable<T> for some type schema T, then add
///         T to es.
///     b. Else if e is not a rest element, add the context type schema of e to
///         es.
///   c. If es is empty, then E is _. This can happen if the list pattern
///     contains only a rest element which doesn't have a context type schema
///     that is known to be an Iterable<T> for some T, like:
///       var [...] = [1, 2];
///       var [...x] = [1, 2];
///   d. Else E is the greatest lower bound of the type schemas in es.
///
/// @description Check that the context type schema for list pattern is
/// the greatest lower bound of the context type schemas of the subpatterns.
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
    var [A v1, B v2, v3] = [b, c, c];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<C>>();
  }
  {
    var [A v1, B v2, v3] = [b, c, d];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<D>>();
  }
  {
    var [A v1, B v2, v3] = <C>[d, d, d];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<C>>();
  }
  try {
    var [A v1, B v2, v3] = [];
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
  } catch (_) {}
}
