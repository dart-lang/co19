// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check that the static type of a map pattern with the type
/// arguments specified are those type arguments.
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
    var <String, B>{"key1": A v1, "key2": B v2, "key3": v3} =
        <String, C>{"key1": d, "key2": c, "key3": c};
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
  }
  {
    final <String, B>{"key1": A v1, "key2": B v2, "key3": v3} =
        <String, D>{"key1": d, "key2": d, "key3": d};
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
  }
}
