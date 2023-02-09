// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check that static type of a list pattern with a type argument,
/// is the pattern's type argument.
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
    var <B>[A v1, B v2, v3] = [b, c, c];
    v1.expectStaticType<Exactly<B>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
  }
  {
    final <B>[A v1, B v2, v3] = <C>[d, d, d];
    v1.expectStaticType<Exactly<B>>();
    v2.expectStaticType<Exactly<B>>();
    v3.expectStaticType<Exactly<B>>();
  }
  var <double>[x1] = [42];
  x1.expectStaticType<Exactly<double>>();

  dynamic pi = 3.14;
  var <double>[x2] = [pi];
  x2.expectStaticType<Exactly<double>>();
}
