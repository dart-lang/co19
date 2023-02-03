// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Cast: The context type schema is _.
///
/// @description Check that for a cast pattern the context type schema is _
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
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

  var (v1 as B) = c;
  v1.expectStaticType<Exactly<C>>();
  final (v2 as B) = d;
  v2.expectStaticType<Exactly<D>>();
  A (v3 as B) = c;
  v3.expectStaticType<Exactly<C>>();
  final A (v4 as B) = d;
  v4.expectStaticType<Exactly<D>>();
  Expect.throws(() {
    var (v5 as B) = "String";
    v5.expectStaticType<Exactly<String>>();
  });
}
