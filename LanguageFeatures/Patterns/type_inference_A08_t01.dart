// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Map: A type schema Map<K, V> where:
/// i. If p has type arguments then K, and V are those type arguments.
/// ii.  Else if p has no entries, then K and V are _.
/// iii. Else K is _ and V is the greatest lower bound of the context type
///     schemas of all value subpatterns.
///
/// @description Check that if map pattern p has type arguments then K, and V
/// are those type arguments.
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
    var <String, A>{"key1": A v1, "key2": B v2, "key3": v3} =
        {"key1": b, "key2": c, "key3": c};
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<A>>();
    v3.expectStaticType<Exactly<A>>();
  }
  {
    final <String, A>{"key1": A v1, "key2": B v2, "key3": v3} =
        <String, C>{"key1": d, "key2": d, "key3": d};
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<A>>();
    v3.expectStaticType<Exactly<A>>();
  }
  try {
    var <String, A>{"key1": A v1, "key2": B v2, "key3": v3} = {};
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<A>>();
    v3.expectStaticType<Exactly<A>>();
  } catch (_) {}
}
